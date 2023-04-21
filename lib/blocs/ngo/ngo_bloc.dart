import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'package:refuge_govt/util/iterable_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'ngo_event.dart';
part 'ngo_state.dart';

class NgoBloc extends Bloc<NgoEvent, NgoState> {
  NgoBloc() : super(NgoInitialState()) {
    on<NgoEvent>((event, emit) async {
      emit(NgoLoadingState());

      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('ngos');

      try {
        if (event is GetAllNgoEvent) {
          List<dynamic> temp = [];
          if (event.query != null) {
            temp = await queryTable
                .select('*')
                .or('name.ilike.%${event.query}%, file_reference_no.ilike.%${event.query}%')
                .order('name', ascending: true);
          } else {
            temp = await queryTable.select('*').order('name', ascending: true);
          }

          List<User> users =
              await supabaseClient.auth.admin.listUsers(perPage: 1000);

          List<Map<String, dynamic>> ngos = temp.map((e) {
            Map<String, dynamic> element = e as Map<String, dynamic>;

            User? user =
                users.firstOrNull((user) => user.id == element['user_id']);

            element['status'] =
                user != null ? user.userMetadata!['status'] : '';
            element['email'] = user != null ? user.email : '';

            return element;
          }).toList();

          emit(NgoSuccessState(ngos: ngos));
        } else if (event is AddNgoEvent) {
          UserResponse userDetails = await supabaseClient.auth.admin.createUser(
            AdminUserAttributes(
              email: event.email,
              password: event.password,
              emailConfirm: true,
              userMetadata: {
                'status': 'active',
              },
            ),
          );
          if (userDetails.user != null) {
            await queryTable.insert({
              'user_id': userDetails.user!.id,
              'name': event.name,
              'phone': event.phone,
              'registration_no': event.registrationNo,
              'file_reference_no': event.fileReferenceNo,
            });
            add(GetAllNgoEvent());
          } else {
            emit(NgoFailureState());
          }
        } else if (event is EditNgoEvent) {
          AdminUserAttributes attributes =
              AdminUserAttributes(email: event.email, emailConfirm: true);

          if (event.password != null) {
            attributes.password = event.password;
          }

          UserResponse userDetails =
              await supabaseClient.auth.admin.updateUserById(
            event.userId,
            attributes: attributes,
          );
          if (userDetails.user != null) {
            await queryTable.update({
              'name': event.name,
              'phone': event.phone,
              'registration_no': event.registrationNo,
              'file_reference_no': event.fileReferenceNo,
            }).eq('user_id', event.userId);
            add(GetAllNgoEvent());
          } else {
            emit(NgoFailureState());
          }
        } else if (event is DeleteNgoEvent) {
          await queryTable.delete().eq('user_id', event.userId);
          await supabaseClient.auth.admin.deleteUser(event.userId);
          add(GetAllNgoEvent());
        } else if (event is ChangeStatusNgoEvent) {
          await supabaseClient.auth.admin.updateUserById(
            event.userId,
            attributes: AdminUserAttributes(
              userMetadata: {
                'status': event.status,
              },
              // banDuration: event.status == 'active' ? 'none' : '1000h0m',
            ),
          );
          add(GetAllNgoEvent());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(NgoFailureState(message: e.toString()));
      }
    });
  }
}
