import 'package:buildcondition/buildcondition.dart';
import 'package:elsendbad/DataBase/insert.dart';
import 'package:elsendbad/cubit/cubit.dart';
import 'package:elsendbad/cubit/states.dart';
import 'package:elsendbad/model/ItemsModel.dart';
import 'package:elsendbad/screen/FollowSO.dart';
import 'package:elsendbad/shared/style/colors.dart';
import 'package:elsendbad/shared/style/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/component.dart';

class SOItems extends StatelessWidget {
  Color? colors;
  bool? cond = true;

  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, states>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "المنتجات فى العربه",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeightManager.medium),
              ),
              actions: [
                CircleAvatar(
                  backgroundColor: ColorManager.darkGrey ,
                  child: IconButton(onPressed: (){
                    cubit.GetItems_Card();
                    NavigatorTo(context, FollowSO());
                  },
                    icon: Icon(Icons.follow_the_signs),
                    color: Colors.white,),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: ColorManager.text_blue,
                  height: 40,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      // SizedBox(width: 15,),
                      Expanded(
                        child: Text(
                          'المنتج', textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.medium),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 55,
                        child: Text(
                          'السعر',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.medium),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 50,
                        child: Text(
                          'الكميه',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.medium),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .17,
                        child: Text(
                          'الاجمالي',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.medium),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BuildCondition(
                    condition: cubit.items_Card.length > 0,
                    builder: (context) => ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        if (index % 2 == 0) {
                          colors = ColorManager.list;
                        } else {
                          colors = ColorManager.list2;
                        }
                        return ItemsCard(
                            colors: colors,
                            context: context,
                            ITEMmodel: cubit.items_Card[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 3,
                      ),
                      itemCount: cubit.items_Card.length,
                    ),
                    fallback: (context) => Container(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: defultButton(
                      text: 'أنشاء امر البيع',
                      ontap: () async {
                        await insertSalesOrder(context:context , Value: cubit.Result );

                      }),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }

  Widget ItemsCard({Items? ITEMmodel, colors, context}) {
    dynamic total = ITEMmodel!.Quantity * ITEMmodel.specialPrice ;
   return Container(
      height: 75,
      color: colors,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              ITEMmodel.itemName!,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorManager.defultblack,
                  fontSize: FontSize.s12,
                  fontWeight: FontWeightManager.medium),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 55,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                ITEMmodel.specialPrice!.toString(),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: ColorManager.defultblack,
                    fontSize: FontSize.s12,
                    fontWeight: FontWeightManager.medium),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                ITEMmodel.Quantity!.toString(), textAlign: TextAlign.center,
                // '1000',
                maxLines: 2,
                style: TextStyle(
                    color: ColorManager.defultblack,
                    fontSize: FontSize.s12,
                    fontWeight: FontWeightManager.medium),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .17,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2),
              child: Text(
                '${total}',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: ColorManager.defultblack,
                    fontSize: FontSize.s12,
                    fontWeight: FontWeightManager.medium),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
