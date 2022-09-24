

import 'package:elsendbad/shared/style/font.dart';
import 'package:elsendbad/shared/style/font.dart';
import 'package:elsendbad/shared/style/font.dart';
import 'package:flutter/material.dart';

String? CustName ;
String? CustPhone ;
int SO_status  = 1 ;
int LE_ID  = 2 ;


Future openmessageNoInternet(context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.all(5),
      content: Text(
        'تأكد من انك متصل بالانترنت',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s14 ),
      ),
    ));

Future openmessageInCart(context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.all(5),
      content: Text(
        'تم الاضافه الى العربة',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s14 ),
      ),
    ));


Future openmessageOutCart(context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.all(5),
      content: Text(
        'تم الحذف من العربة',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s14 ),
      ),
    ));

Future openmessageFollowOrder(context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.all(5),
      content: Text(
        'الطلب تحت التجهيز',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s14 ),
      ),
    ));