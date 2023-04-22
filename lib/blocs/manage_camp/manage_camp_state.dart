part of 'manage_camp_bloc.dart';

@immutable
abstract class ManageCampState {}

class ManageCampInitialState extends ManageCampState {}

class ManageCampLoadingState extends ManageCampState {}

class ManageCampSuccessState extends ManageCampState {
  final List<dynamic> camps;

  ManageCampSuccessState({required this.camps});
}

class ManageCampFailureState extends ManageCampState {
  final String message;

  ManageCampFailureState(
      {this.message =
          'Something went wrong, Please check your connection and try again!.'});
}
