import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_template/constants/enums/enum.dart';
import 'package:counter_template/features/network/cubit/network_cubit.dart';
import 'package:flutter/widgets.dart';

part 'couter_cubit_state.dart';

class CouterCubitCubit extends Cubit<CounterData> {
  final NetworkCubit networkCubit;
  StreamSubscription streamSubscription;

  CouterCubitCubit({@required this.networkCubit})
      : super(CounterData(
          counterValue: 0,
          isincrement: false,
        )) {
    networkStreamCounter();
  }

  StreamSubscription<InternertState> networkStreamCounter() {
    return streamSubscription =
        networkCubit.listen((InternertState internertState) {
      if (internertState is InternertConnected &&
              internertState.networkConnection == NetworkConnection.WIFI ||
          internertState is InternertConnected &&
              internertState.networkConnection == NetworkConnection.MOBILE) {
        incrementCounter();
      }
    });
  }

  void incrementCounter() {
    emit(
      CounterData(
        counterValue: state.counterValue + 1,
        isincrement: false,
      ),
    );
  }

  void decrementCounter() {
    if (state.counterValue > 0) {
      emit(
        CounterData(
          counterValue: state.counterValue - 1,
          isincrement: true,
          status: "Increment",
        ),
      );
    }
    if (state.counterValue < 1) {
      emit(
        CounterData(
          counterValue: 0,
          isincrement: true,
          status: "Increment",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
