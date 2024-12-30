import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeapp/core/usecases.dart';
import 'package:homeapp/pages/bloc/controller_bloc.dart';
import 'package:homeapp/pages/widgets/hometile_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lightcontroller = ValueNotifier<bool>(false);
    final accontroller = ValueNotifier<bool>(false);
    final tvcontroller = ValueNotifier<bool>(false);
    final fancontroller = ValueNotifier<bool>(false);

    List<ValueNotifier<bool>> list = [
      lightcontroller,
      accontroller,
      tvcontroller,
      fancontroller
    ];

    return BlocProvider(
      create: (context) => ControllerBloc(),
      child: BlocConsumer<ControllerBloc, ControllerState>(
        listener: (context, state) {
          if (state is LightButtonClickedState) {
            lightcontroller.value = state.result;
          } else if (state is AcButtonClickedState) {
            accontroller.value = state.result;
          } else if (state is TvButtonClickedState) {
            tvcontroller.value = state.result;
          } else if (state is FanButtonClickedState) {
            fancontroller.value = state.result;
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu_outlined,
                            size: 50,
                          ),
                          Icon(
                            Icons.person,
                            size: 50,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Welcome Home,',
                        style: TextStyle(color: Colors.grey[700], fontSize: 25),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'VINEESH',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Smart Devices',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 800,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 4,
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 30,
                          ),
                          itemCount: tabnames.length,
                          itemBuilder: (context, index) => HometileWidget(
                            controller: list[index],
                            image: tabimages[index],
                            name: tabnames[index],
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
