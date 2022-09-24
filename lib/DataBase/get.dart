import '../model/ItemsModel.dart';
import '../model/SOItem_Model.dart';
import '../model/SalesOrder_Model.dart';
import 'insert.dart';

List<Items> items_data = [];
getDatabase(database )async{
  items_data = [];
  print('iiiiii    items_data.length   ' + items_data.length.toString());
  database.rawQuery('SELECT * FROM Items').then((value) {
    value.forEach((element) {
      Items itemModel =Items.fromJson(element);
      itemModel.inCart = 0 ;
      itemModel.Quantity = 1 ;
      items_data.add(itemModel);
      print (element );
    });
    print('    items_data.length  ii ' + items_data.length.toString());
  });
}


SalesOrder_Model ? INVOICE_model  ;
List<SalesOrder_Model> SalesOrder_ModelList = [];
//List<SalesOrder_Model> SalesOrder_ModelListReversed = [];
getSalesOrder({database, context}) async {
  database.rawQuery('SELECT  * FROM MobSalesOrder').then((value) {
    SalesOrder_ModelList = [];
    value.forEach((element) {
      SalesOrder_Model itemModel =SalesOrder_Model.fromJson(element);
      SalesOrder_ModelList.add(itemModel);
      print(element);
    });
    if(SalesOrder_ModelList.length > 0)
      INVOICE_model = SalesOrder_ModelList[SalesOrder_ModelList.length-1] ;
 //   print('   SalesOrder_ModelList.length  ' + SalesOrder_ModelList.length.toString());
  //  SalesOrder_ModelListReversed = SalesOrder_ModelList.reversed.toList();
  });
  if( context != null ) {
    insertSalesOrderItems(context) ;
  }
}


List<SOItem_Model> MobPosSOItemList = [];
getSalesOrderItem(database) async {
  print('  MobPosSOItemList  ' + MobPosSOItemList.length.toString());
  database.rawQuery('SELECT * FROM MobSOItem').then((value) async {
    MobPosSOItemList = [];
    await value.forEach((element) {
      print('element MobPosInvoiceItem '+' ${element}');
      SOItem_Model itemModel = SOItem_Model.fromJson(element);
      MobPosSOItemList.add(itemModel);
    });
    print('MobPosSOItemList   ' + MobPosSOItemList.length.toString());
  });

}
