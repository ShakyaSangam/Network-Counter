import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_template/features/counter/cubit/couter_cubit_cubit.dart';
import 'package:counter_template/features/network/cubit/network_cubit.dart';
import 'package:counter_template/presentations/pages/playGround.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteAccess {
  Connectivity connectivity;

  RouteAccess() {
    this.connectivity = Connectivity();
  }

  Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.arguments) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NetworkCubit(
                  connectivity: connectivity,
                ),
              ),
              BlocProvider(
                create: (context) => CouterCubitCubit(
                  networkCubit: BlocProvider.of<NetworkCubit>(context),
                ),
              ),
            ],
            child: MyHomePage(title: "welcome"),
          ),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NetworkCubit(
                  connectivity: connectivity,
                ),
              ),
              BlocProvider(
                create: (context) => CouterCubitCubit(
                  networkCubit: BlocProvider.of<NetworkCubit>(context),
                ),
              ),
            ],
            child: MyHomePage(title: "welcome"),
          ),
        );
    }
  }
}
