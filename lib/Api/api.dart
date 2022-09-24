
import 'dart:convert';

import 'package:elsendbad/DataBase/get.dart';
import 'package:elsendbad/model/ItemsModel.dart';
import '../DataBase/database.dart';
import '../shared/cach_Helper.dart';
import '../shared/Network/dio_helper.dart';



getItemdata()
{
  DioHelper.getdata (
    url: 'http://loft11174.serverprofi24.com:7007/Sendbad.API/rest/1/item/'
  ).then((value) async {
    print(value);
    String v =value.data.trim().replaceAll('\r\n', '');
    APPModel model=APPModel.fromJson(jsonDecode(v));
    print(model.items[0].itemName.toString());
    await database.transaction((txn)async {
      await txn.delete('Items');});
    model.items.forEach((element)  async {
      await   database.insert('Items', element.toJson());
      // await insertDatabase(
      //     ItemId: element.itemId!, ItemName: element.itemName!,
      //     LeId: element.leId! as int,
      //     Priceitem: element.priceitem! as int,
      //     SpecialPrice: element.specialPrice! as int, Balance: element.balance! as int);
    });
    Cach_helper.SaveData(key: "upload", value: true);
   await getDatabase(database);
  } ).catchError((Error)
  {print("eee getItemdata  "+Error.toString());
  });
}
