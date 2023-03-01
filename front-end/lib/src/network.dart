import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

final _streamController = BehaviorSubject<ConnectivityResult>();
final Stream<ConnectivityResult> networkStream =
    _streamController.asBroadcastStream().asBroadcastStream();

startNetworkChecking() =>
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _streamController.sink.add(result);
    });

checkInternetConnection() async {
  try {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    _streamController.sink.add(result);
  } on PlatformException catch (e) {}
}
