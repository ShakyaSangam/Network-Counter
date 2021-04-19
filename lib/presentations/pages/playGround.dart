import 'package:counter_template/constants/enums/enum.dart';
import 'package:counter_template/features/counter/cubit/couter_cubit_cubit.dart';
import 'package:counter_template/features/network/cubit/network_cubit.dart';
import 'package:counter_template/presentations/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NetworkCubit, InternertState>(
          builder: (BuildContext ctx, InternertState state) {
            return Container(
              color: (state is InternertConnected &&
                          state.networkConnection == NetworkConnection.WIFI ||
                      state is InternertConnected &&
                          state.networkConnection == NetworkConnection.MOBILE)
                  ? Colors.green
                  : Colors.red,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // * BUILD-COUNTER-WIDGET
                  CounterWidget(),
                  if (state is InternertConnected &&
                          state.networkConnection == NetworkConnection.WIFI ||
                      state is InternertConnected &&
                          state.networkConnection ==
                              NetworkConnection.MOBILE) ...[
                    GestureDetector(
                      onTap: context.watch<CouterCubitCubit>().incrementCounter,
                    )
                  ] else ...[
                    GestureDetector(
                      onTap: context.watch<CouterCubitCubit>().decrementCounter,
                    )
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
