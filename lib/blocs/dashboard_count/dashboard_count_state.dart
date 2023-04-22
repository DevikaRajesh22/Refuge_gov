part of 'dashboard_count_bloc.dart';

@immutable
abstract class DashboardCountState {}

class DashboardCountInitialState extends DashboardCountState {}

class DashboardCountLoadingState extends DashboardCountState {}

class DashboardCountSuccessState extends DashboardCountState {
  final Map<String, dynamic> dashbordCount;

  DashboardCountSuccessState({required this.dashbordCount});
}

class DashboardCountFailureState extends DashboardCountState {
  final String message;

  DashboardCountFailureState({
    this.message =
        'Something went wrong, Please check your connection and try again!.',
  });
}
