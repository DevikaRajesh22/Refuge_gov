part of 'manage_camp_bloc.dart';

@immutable
abstract class ManageCampEvent {}

class GetAllCampEvent extends ManageCampEvent {
  final String? query;

  GetAllCampEvent({this.query});
}

class AddCampEvent extends ManageCampEvent {
  final String name, address;

  AddCampEvent({
    required this.name,
    required this.address,
  });
}

class EditCampEvent extends ManageCampEvent {
  final String name, address;
  final int campId;

  EditCampEvent({
    required this.name,
    required this.address,
    required this.campId,
  });
}

class DeleteCampEvent extends ManageCampEvent {
  final int campId;

  DeleteCampEvent({required this.campId});
}
