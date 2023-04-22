import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'dashboard_count_event.dart';
part 'dashboard_count_state.dart';

class DashboardCountBloc
    extends Bloc<DashboardCountEvent, DashboardCountState> {
  DashboardCountBloc() : super(DashboardCountInitialState()) {
    on<DashboardCountEvent>((event, emit) async {
      emit(DashboardCountLoadingState());

      final SupabaseClient supabaseClient = Supabase.instance.client;

      PostgrestResponse hazardCount = await supabaseClient
          .from('hazard_reports')
          .select('*', const FetchOptions(count: CountOption.exact));

      PostgrestResponse serviceCount = (await supabaseClient
          .from('emergency_service_requests')
          .select('*', const FetchOptions(count: CountOption.exact)));

      PostgrestResponse refugeesCount = await supabaseClient
          .from('refugees')
          .select('*', const FetchOptions(count: CountOption.exact));

      PostgrestResponse campsCount = await supabaseClient
          .from('camps')
          .select('*', const FetchOptions(count: CountOption.exact));

      PostgrestResponse disasterCount = await supabaseClient
          .from('disasters')
          .select('*', const FetchOptions(count: CountOption.exact));

      PostgrestResponse ngoCount = (await supabaseClient
          .from('ngos')
          .select('*', const FetchOptions(count: CountOption.exact)));

      PostgrestResponse complaintsCount = await supabaseClient
          .from('complaints')
          .select('*', const FetchOptions(count: CountOption.exact));

      PostgrestResponse suggestionCount = await supabaseClient
          .from('suggestions')
          .select('*', const FetchOptions(count: CountOption.exact));

      try {
        Map<String, dynamic> dashbordCount = {
          'hazard': hazardCount.count.toString(),
          'service_requests': serviceCount.count.toString(),
          'refugees': refugeesCount.count.toString(),
          'camps': campsCount.count.toString(),
          'disasters': disasterCount.count.toString(),
          'ngos': ngoCount.count.toString(),
          'complaints': complaintsCount.count.toString(),
          'suggestions': suggestionCount.count.toString(),
        };

        Logger().w(dashbordCount);

        emit(DashboardCountSuccessState(dashbordCount: dashbordCount));
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(DashboardCountFailureState());
      }
    });
  }
}
