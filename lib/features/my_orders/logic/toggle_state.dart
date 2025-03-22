class ToggleState {}

class ToggleInitial extends ToggleState {}

final class ToggleLoading extends ToggleState {}

final class ToggleSuccess extends ToggleState {
  final int index;
  ToggleSuccess({required this.index});
}

final class ToggleFailure extends ToggleState {
  String message;
  ToggleFailure({required this.message});
}
