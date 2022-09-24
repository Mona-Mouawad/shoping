
import 'package:elsendbad/cubit/cubit.dart';
import 'package:elsendbad/shared/content.dart';
import 'package:intl/intl.dart';

import '../model/SOItem_Model.dart';
import 'database.dart';
import 'get.dart';

bool insertINVOICES = false;

// MobSalesOrder(SalesOrderId INTEGER NOT NULL , SalesOrderDate TEXT NOT NULL , LeId INTEGER ,'
// 'Value REAL NOT NULL ,  CustVenName TEXT NOT NULL, CustPhone TEXT NOT NULL
insertSalesOrder(
    {context,
      dynamic? Value,
    }) async {
  insertINVOICES = false;
  String INVOICEDATE = DateFormat('dd/MM/yyyy')
      .format(DateTime.now())
      .toString(); //'dd/MM/yyyy hh:mm:ss a'
  print(INVOICEDATE);

  await database.transaction((txn) =>
      txn
          .rawInsert(
          'INSERT INTO MobSalesOrder(Value,SalesOrderDate,CustPhone,CustVenName,LeId,status) '
              'VALUES($Value,"$INVOICEDATE","$CustPhone","$CustName",$LE_ID,"new")')
          .then((value) async {
        print('$value inserted');
        insertINVOICES = true;
        print('insertINVOICES  ' + insertINVOICES.toString());
        await getSalesOrder(database: database, context: context);
      }));
}

 insertSalesOrderItems(context) async {
    AppCubit.get(context).items_Card.forEach((element) async {
      String? Barcode ;
      print('$Barcode       Barcode            Barcode');
      await database.transaction((txn) => txn
          .rawInsert(
          'INSERT INTO MobSOItem(ItemId,ItemName,CustVenName,Price,Total,Quantity,SalesOrderId,LeId,CustPhone,status) '
              'VALUES(${element.itemId},"${element.itemName}","${CustName}",${element.specialPrice},${element.specialPrice * element.Quantity},'
              '${element.Quantity},${INVOICE_model!.SalesOrderId}, $LE_ID,"$CustPhone","new")')
          .then((value) {
        print('$value inserted');
      }));
    });
    await getSalesOrderItem(database);
    AppCubit.get(context).items_Card = [];
    AppCubit.get(context).UpdateItems_Card();
    openmessageFollowOrder(context);
  }




