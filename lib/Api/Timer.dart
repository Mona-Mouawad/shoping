

import 'dart:async';

import 'package:elsendbad/shared/Network/checkConnection.dart';

import 'api.dart';

GetDataTimer() {
  Timer.periodic(Duration(hours: 2), (timerItemsGet) async {
   await CheckConnection();
    if(ConnectionStatus)
      {
        getItemdata();
      }
  });
}