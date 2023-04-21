part of 'ngo_bloc.dart';

@immutable
abstract class NgoEvent {}

class AddNgoEvent extends NgoEvent {
  final String name, phone, email, password, registrationNo, fileReferenceNo;

  AddNgoEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.registrationNo,
    required this.fileReferenceNo,
  });
}

class EditNgoEvent extends NgoEvent {
  final String name, phone, email, userId, registrationNo, fileReferenceNo;
  final String? password;

  EditNgoEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.userId,
    required this.registrationNo,
    required this.fileReferenceNo,
    this.password,
  });
}

class DeleteNgoEvent extends NgoEvent {
  final String userId;

  DeleteNgoEvent({required this.userId});
}

class ChangeStatusNgoEvent extends NgoEvent {
  final String userId, status;

  ChangeStatusNgoEvent({
    required this.userId,
    required this.status,
  });
}

class GetAllNgoEvent extends NgoEvent {
  final String? query;

  GetAllNgoEvent({this.query});
}
