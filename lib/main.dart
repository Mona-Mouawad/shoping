import 'package:elsendbad/DataBase/get.dart';
import 'package:elsendbad/screen/FollowSO.dart';
import 'package:elsendbad/screen/Login.dart';
import 'package:elsendbad/shared/content.dart';
import 'package:elsendbad/shared/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elsendbad/screen/show_item.dart';
import 'package:elsendbad/shared/cach_Helper.dart';
import 'DataBase/database.dart';
import 'shared/bloc_observer.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'shared/Network/dio_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Cach_helper.init();
  DioHelper.init();
  await createdatabase();
  await getDatabase(database);
  CustName = Cach_helper.GetData(key: 'CustName') ?? null ;
  CustPhone = Cach_helper.GetData(key: 'CustPhone') ?? null  ;
  bool ? Upload = Cach_helper.GetData(key: "upload");
  print(Upload);
  Widget startScreen =  loginScreen() ;

  if(CustName != null )
    {
      startScreen =  show_screen() ;
    }

    runApp(MyApp(startwidget: startScreen,));

}

class MyApp extends StatefulWidget{
  @override
  final Widget? startwidget;
  MyApp({this.startwidget});
  _MyAppState createState() => _MyAppState(startwidget: startwidget);
}

class _MyAppState extends State<MyApp> {
  @override
  final Widget? startwidget;
  _MyAppState({this.startwidget});
    // TODO: implement build
    Widget build(BuildContext context) {
      return BlocProvider(
          create: (BuildContext context)=>AppCubit()..getItems(),//..checkConnection(),
          child:BlocConsumer<AppCubit, states>(
            listener: (context, state) {},
            builder: (context, state) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme ,
               // home:  FollowSO()
                home:  startwidget
            ),
          )
      );
    }
}


