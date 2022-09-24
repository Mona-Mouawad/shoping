
import 'package:elsendbad/shared/Network/dio_helper.dart';

bool ConnectionStatus = false;

CheckConnection()
async {
  DioHelper.getdata(url: 'http://loft11174.serverprofi24.com:7007/Sendbad.API/rest/1/item/')
      .then((value) async {
    print('value.statusCode    ' + value.statusCode.toString());
    ConnectionStatus = true;
  }).catchError((Error) {
    print("  Error   CheckConnection  " + Error.toString());
    ConnectionStatus = false;
  });
}