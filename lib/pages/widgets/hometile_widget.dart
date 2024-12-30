import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class HometileWidget extends StatelessWidget {
  const HometileWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.controller});
  final String image;
  final String name;
  final ValueNotifier<bool> controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      height: 300,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            color: Colors.green,
            scale: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: AdvancedSwitch(
                  controller: controller,
                  onChanged: (value) {
                    print(controller.value);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
