class ToggleState {}

class ToggleInitial extends ToggleState {}

final class ToggleLoading extends ToggleState {}

final class ToggleSuccess extends ToggleState {
}

final class ToggleFailure extends ToggleState {
  String message;
  ToggleFailure({required this.message});
}
