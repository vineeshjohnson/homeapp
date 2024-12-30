part of 'controller_bloc.dart';

@immutable
sealed class ControllerEvent {}


final class LightButtonClickedEvent extends ControllerEvent{

}
final class AcButtonClickedEvent extends ControllerEvent{
  
}
final class TvButtonClickedEvent extends ControllerEvent{


}

final class FanButtonClickedEvent extends ControllerEvent{
  
}