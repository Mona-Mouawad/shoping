
import 'dart:convert';

import 'package:elsendbad/Api/Timer.dart';
import 'package:elsendbad/Api/api.dart';
import 'package:elsendbad/cubit/states.dart';
import 'package:elsendbad/screen/show_item.dart';
import 'package:elsendbad/shared/cach_Helper.dart';
import 'package:elsendbad/shared/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../DataBase/database.dart';
import '../DataBase/get.dart';
import '../model/ItemsModel.dart';
import '../shared/cach_Helper.dart';
import '../shared/Network/dio_helper.dart';
import '../shared/content.dart';

class Logincubit extends Cubit<states> {
  Logincubit() : super(initstates());

  static Logincubit get(context) => BlocProvider.of(context);

  Login({
    required  String Cust_Name ,
    required String Cust_Phone ,
    required context
})
  async {
    emit(Loadingloginstate());
      DioHelper.getdata (
          url: 'http://loft11174.serverprofi24.com:7007/Sendbad.API/rest/1/item/'
      ).then((value) async {
        print(value);
        String v =value.toString().trim().replaceAll('\r\n', '');
        APPModel  model=APPModel.fromJson(jsonDecode(v));
        print(model.items[1].itemName.toString());
        await database.transaction((txn)async {
          await txn.delete('Items');});
        model.items.forEach((element)  async {
         await   database.insert('Items', element.toJson());
          });
        await getDatabase(database);
        Cach_helper.SaveData(key: 'CustName', value: Cust_Name) ;
        Cach_helper.SaveData(key: 'CustPhone', value: Cust_Phone) ;
        CustName = Cach_helper.GetData(key: 'CustName')  ;
        CustPhone = Cach_helper.GetData(key: 'CustPhone')  ;
        Future.delayed(Duration(seconds: 2),() {
          emit(Successloginstate());
          NavigatorAndFinish(context,
              show_screen());
        });
        GetDataTimer();
      } ).catchError((Error)
      {print("eee getItemdata  "+Error.toString());
      openmessageNoInternet(context);
      emit(Errorloginstate());
      });



  }

}

