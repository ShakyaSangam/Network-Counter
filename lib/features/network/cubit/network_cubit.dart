import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_template/constants/enums/enum.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<InternertState> {
  final Connectivity connectivity;
  StreamSubscription streamSubscription;

  NetworkCubit({@required this.connectivity}) : super(InitialLoading()) {
    networkStreamConnection();
  }

  StreamSubscription<ConnectivityResult> networkStreamConnection() {
    return streamSubscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult event) {
        if (event == ConnectivityResult.wifi) {
          internetConnected(
            networkConnection: NetworkConnection.WIFI,
          );
        } else if (event == ConnectivityResult.mobile) {
          internetConnected(
            networkConnection: NetworkConnection.MOBILE,
          );
        } else if (event == ConnectivityResult.none) {
          internetDisconnected();
        }
      },
    );
  }

  void internetConnected({NetworkConnection networkConnection}) {
    if (networkConnection == NetworkConnection.WIFI) {
      emit(
        InternertConnected(
          networkConnection: NetworkConnection.WIFI,
        ),
      );
    }
    if (networkConnection == NetworkConnection.MOBILE) {
      emit(
        InternertConnected(
          networkConnection: NetworkConnection.MOBILE,
        ),
      );
    }
  }

  void internetDisconnected() {
    emit(
      InternertDisconnected(),
    );
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
