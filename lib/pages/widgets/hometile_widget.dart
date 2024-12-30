import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeapp/pages/bloc/controller_bloc.dart';

class HometileWidget extends StatelessWidget {
  const HometileWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.controller,
      required this.index});

  final String image;
  final String name;
  final ValueNotifier<bool> controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ControllerBloc, ControllerState>(
      listener: (context, state) {},
      builder: (context, state) {
        bool v = controller.value;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          height: 300,
          width: 100,
          decoration: BoxDecoration(
            color: v ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                color: v ? Colors.green : Colors.red,
                scale: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Text(
                      name,
                      style: TextStyle(
                        color: v ? Colors.black : Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: AdvancedSwitch(
                      controller: controller,
                      onChanged: (value) {
                        if (index == 0) {
                          context
                              .read<ControllerBloc>()
                              .add(LightButtonClickedEvent(click: value));
                        }
                        if (index == 1) {
                          context
                              .read<ControllerBloc>()
                              .add(AcButtonClickedEvent(click: value));
                        }
                        if (index == 2) {
                          context
                              .read<ControllerBloc>()
                              .add(TvButtonClickedEvent(click: value));
                        }
                        if (index == 3) {
                          context
                              .read<ControllerBloc>()
                              .add(FanButtonClickedEvent(click: value));
                        }
                      },
                    ),
                  ),
                ],
              ),
              Text(
                v ? 'On' : 'Off',
                style: TextStyle(
                    color: v ? Colors.green : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }
}
