import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_camp_event.dart';
part 'manage_camp_state.dart';

class ManageCampBloc extends Bloc<ManageCampEvent, ManageCampState> {
  ManageCampBloc() : super(ManageCampInitialState()) {
    on<ManageCampEvent>((event, emit) async {
      emit(ManageCampLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('camps');
      try {
        if (event is GetAllCampEvent) {
          List<dynamic> temp = [];

          if (event.query != null) {
            temp = await queryTable
                .select('*')
                .ilike('name', '%${event.query}%')
                .order('name', ascending: true);
          } else {
            temp = await queryTable.select('*').order('name', ascending: true);
          }

          List<Map<String, dynamic>> camps =
              temp.map((e) => e as Map<String, dynamic>).toList();

          for (int i = 0; i < camps.length; i++) {
            camps[i]['ngo'] = await supabaseClient
                .from('ngos')
                .select('*')
                .eq('user_id', camps[i]['ngo_id'])
                .maybeSingle();
          }

          Logger().w(camps);

          emit(
            ManageCampSuccessState(camps: camps),
          );
        } else if (event is AddCampEvent) {
          await queryTable.insert(
            {
              'name': event.name,
              'address': event.address,
              'ngo_id': supabaseClient.auth.currentUser!.id,
            },
          );

          add(GetAllCampEvent());
        } else if (event is EditCampEvent) {
          await queryTable.update({
            'name': event.name,
            'address': event.address,
          }).eq('id', event.campId);
          add(GetAllCampEvent());
        } else if (event is DeleteCampEvent) {
          await queryTable.delete().eq('id', event.campId);
          add(GetAllCampEvent());
        }
      } catch (e, s) {
        Logger().wtf('$e,$s');
        emit(ManageCampFailureState());
      }
    });
  }
}
