import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeapp/core/usecases.dart';
import 'package:homeapp/pages/bloc/controller_bloc.dart';
import 'package:homeapp/pages/widgets/hometile_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _lightcontroller = ValueNotifier<bool>(false);
    final _accontroller = ValueNotifier<bool>(false);
    final _tvcontroller = ValueNotifier<bool>(false);
    final _fancontroller = ValueNotifier<bool>(false);

    List<ValueNotifier<bool>> list = [
      _lightcontroller,
      _accontroller,
      _tvcontroller,
      _fancontroller
    ];

    return BlocProvider(
      create: (context) => ControllerBloc(),
      child: BlocConsumer<ControllerBloc, ControllerState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Welcome Home,',
                        style: TextStyle(color: Colors.grey[700], fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'VINEESH',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Smart Devices',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 600,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 30,
                          ),
                          itemCount: tabnames.length,
                          itemBuilder: (context, index) => HometileWidget(
                            controller: list[index],
                            image: tabimages[index],
                            name: tabnames[index],
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
