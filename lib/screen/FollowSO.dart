import 'package:buildcondition/buildcondition.dart';
import 'package:elsendbad/cubit/cubit.dart';
import 'package:elsendbad/cubit/states.dart';
import 'package:elsendbad/model/ItemsModel.dart';
import 'package:elsendbad/shared/content.dart';
import 'package:elsendbad/shared/style/colors.dart';
import 'package:elsendbad/shared/style/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/component.dart';

class FollowSO extends StatelessWidget {

  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, states>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "متابعة امر البيع",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.s18,
                    fontWeight: FontWeightManager.medium),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('تحت التجهيز', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeightManager.medium , fontSize: FontSize.s14),),
                    Radio(value: 1, groupValue: SO_status , onChanged: (int? value) {  },
                    )
                  ],),
                SizedBox(
                  height: 5,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('تم التجهيز', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeightManager.medium , fontSize: FontSize.s14),),
                    Radio(value: 2, groupValue: SO_status , onChanged: (int? value) {  },
                       )
                  ],),
                SizedBox(
                  height: 5,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('تم الشحن', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeightManager.medium , fontSize: FontSize.s14),),
                    Radio(value: 3, groupValue: SO_status , onChanged: (int? value) {  },
                    )
                  ],),
                SizedBox(
                  height: 5,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('تم الاستلام', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeightManager.medium , fontSize: FontSize.s14),),
                    Radio(value: 4, groupValue: SO_status , onChanged: (int? value) {  },
                    )
                  ],),
              ],
            ),
          );
        });
  }

}
