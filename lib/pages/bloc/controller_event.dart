part of 'controller_bloc.dart';

@immutable
sealed class ControllerEvent {}

final class LightButtonClickedEvent extends ControllerEvent {
  final bool click;
  LightButtonClickedEvent({required this.click});
}

final class AcButtonClickedEvent extends ControllerEvent {
    final bool click;

  AcButtonClickedEvent({required this.click});

}

final class TvButtonClickedEvent extends ControllerEvent {
    final bool click;

  TvButtonClickedEvent({required this.click});

}

final class FanButtonClickedEvent extends ControllerEvent {
    final bool click;

  FanButtonClickedEvent({required this.click});

}
