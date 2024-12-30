part of 'controller_bloc.dart';

@immutable
sealed class ControllerState {}

final class ControllerInitial extends ControllerState {}

final class LightButtonClickedState extends ControllerState {
  final bool result;
  LightButtonClickedState({required this.result});
}
final class AcButtonClickedState extends ControllerState {
  final bool result;
 AcButtonClickedState({required this.result});
}
final class TvButtonClickedState extends ControllerState {
  final bool result;
  TvButtonClickedState({required this.result});
}
final class FanButtonClickedState extends ControllerState {
  final bool result;
  FanButtonClickedState({required this.result});
}

