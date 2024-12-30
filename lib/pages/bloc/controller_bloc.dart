import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  ControllerBloc() : super(ControllerInitial()) {
    on<ControllerEvent>((event, emit) {});

    on<LightButtonClickedEvent>((event, emit) {
      emit(LightButtonClickedState(result: event.click));
    });
    on<AcButtonClickedEvent>((event, emit) {
      emit(AcButtonClickedState(result: event.click));
    });
    on<TvButtonClickedEvent>((event, emit) {
      emit(TvButtonClickedState(result: event.click));
    });
    on<FanButtonClickedEvent>((event, emit) {
      emit(FanButtonClickedState(result: event.click));
    });
  }
}
