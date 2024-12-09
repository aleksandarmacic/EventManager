abstract class AddEventState {}

class AddEventInitial extends AddEventState {}

class AddEventLoading extends AddEventState {}

class AddEventSuccess extends AddEventState {
  final String successMessage;

  AddEventSuccess(this.successMessage);
}

class AddEventFailure extends AddEventState {
  final String errorMessage;

  AddEventFailure(this.errorMessage);
}