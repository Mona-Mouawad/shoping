import 'package:elsendbad/shared/style/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elsendbad/shared/style/colors.dart';

ThemeData lightTheme=
   ThemeData(
     primarySwatch: Colors.lightBlue ,
      backgroundColor:Colors.white,
      //  fontFamily: 'Urd',
        appBarTheme: AppBarTheme(
          color: ColorManager.primary ,
            centerTitle: true,
                  // color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white ,
            fontSize: FontSize.s16 ,fontWeight:FontWeightManager.semiBold
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ColorManager.primary,
           )
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: FontSize.s12 ,fontWeight:  FontWeightManager.medium,
          color: ColorManager.defultblack)
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      );


