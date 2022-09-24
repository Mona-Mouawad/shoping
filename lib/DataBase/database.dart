import 'package:sqflite/sqflite.dart';

late Database database;

createdatabase()async
{
  database=await openDatabase(
      'todot.db',
      version: 1,
      onCreate: (database,version)
      async {

        await database.execute('CREATE TABLE Items(ItemId INTEGER PRIMARY KEY  , ItemName TEXT ,LeId INTEGER ,'
            'Priceitem REAL NOT NULL , SpecialPrice REAL , Balance INTEGER , inCart INTEGER , Quantity INTEGER )').then(
                (value) => print('creat Items db'));


        await database.execute('CREATE TABLE MobSOItem(SOItemId INTEGER PRIMARY KEY  NOT NULL , ItemId INTEGER NOT NULL , ItemName TEXT NOT NULL ,LeId INTEGER ,'
            'Price REAL NOT NULL , Total REAL NOT NULL, Quantity INTEGER NOT NULL, SalesOrderId INTEGER NOT NULL ,'
            ' CustVenName TEXT NOT NULL, CustPhone TEXT NOT NULL , status TEXT ,'
            ' FOREIGN KEY(SalesOrderId)REFERENCES MobSalesOrder (SalesOrderId))').then(
                (value) => print('creat MobSOItem db'));


        await database.execute('CREATE TABLE MobSalesOrder(SalesOrderId INTEGER PRIMARY KEY  NOT NULL , SalesOrderDate TEXT NOT NULL , LeId INTEGER ,'
            'Value REAL NOT NULL ,  CustVenName TEXT NOT NULL, CustPhone TEXT NOT NULL , status TEXT )').then(
                (value) => print('creat MobSalesOrder db'));


        await database.execute('CREATE TABLE MobInquirySalesOrder(InquirySalesOrderId INTEGER PRIMARY KEY  NOT NULL , InquiryStatus INTEGER NOT NULL ,LeId INTEGER ,'
            ' SalesOrderId INTEGER NOT NULL , CustVenName TEXT NOT NULL, CustPhone TEXT NOT NULL ,'
            ' FOREIGN KEY(SalesOrderId)REFERENCES MobSalesOrder (SalesOrderId))').then(
                (value) => print('creat MobSOItem db'));

      },
      onOpen: (database)
      async {
        print('database opened');
      }).then((value){
    database = value;
    return value ;});
}



