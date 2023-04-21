part of 'ngo_bloc.dart';

@immutable
abstract class NgoState {}

class NgoInitialState extends NgoState {}

class NgoLoadingState extends NgoState {}

class NgoSuccessState extends NgoState {
  final List<Map<String, dynamic>> ngos;

  NgoSuccessState({required this.ngos});
}

class NgoFailureState extends NgoState {
  final String message;

  NgoFailureState({
    this.message =
        'Something went wrong, Please check your connection and try again!.',
  });
}
