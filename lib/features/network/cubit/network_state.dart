part of 'network_cubit.dart';

@immutable
abstract class InternertState {}

class InitialLoading extends InternertState {}

class InternertConnected extends InternertState {
  final NetworkConnection networkConnection;
  InternertConnected({this.networkConnection});
}

class InternertDisconnected extends InternertState {}
