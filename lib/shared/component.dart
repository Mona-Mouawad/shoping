import 'package:buildcondition/buildcondition.dart';
import 'package:elsendbad/cubit/cubit.dart';
import 'package:elsendbad/shared/style/colors.dart';
import 'package:elsendbad/shared/style/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/ItemsModel.dart';

Widget defultTextField({
  required context,
  TextEditingController? controller,
  TextInputType? type,
  String? labal,
  IconData? prefix,
  suffix,
  suffixpressed,
  String? initivalue,
  Function(String)? onsubmit,
  onchange,
  ontap,
  required String? Function(String?) vaildate,
  bool ispassword = false,
  enable = true,
}) =>
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        //  height: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(.9),),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextFormField(
            controller: controller,
            textDirection: TextDirection.rtl,
            keyboardType: type,
            obscureText: ispassword,
            textAlign: TextAlign.start,
            cursorColor: ColorManager.primary,
            decoration: InputDecoration(
              focusColor: ColorManager.primary,
              suffixIconColor: ColorManager.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: ColorManager.primary,
                ),
              ),
              labelText: labal,
              iconColor: ColorManager.primary,
              suffixIcon: suffix != null
                  ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
                  : null,
              prefixIcon: Icon(prefix),
              hoverColor: ColorManager.primary,
              fillColor: ColorManager.primary,
              prefixIconColor: ColorManager.primary,
              hintTextDirection: TextDirection.rtl,
            ),
            validator: vaildate,
            onChanged: onchange,
            onTap: ontap,
            onFieldSubmitted: onsubmit,
            initialValue: initivalue,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );

Widget defultButton({required String text, required VoidCallback ontap}) =>
    Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.primary,
      ),
      child: MaterialButton(
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeightManager.bold),
        ),
      ),
    );

Widget myDivited() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 2,
        color: Colors.black,
      ),
    );

void NavigatorTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void NavigatorAndFinish(context, Widget) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => Widget), (route) {
    return false;
  });
}

Widget builditem({Items? model, context, bool search = false, index}) {
  var cubit =AppCubit.get(context);
return  Card(
      shadowColor: ColorManager.primary,
      margin: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 10,
          ),
     if(search)
          Column(
            children: [
              BuildCondition(
                condition: model!.inCart == 1 ,
                builder: (context) => CircleAvatar(
                  backgroundColor: ColorManager.primary,
                  child: IconButton(
                    onPressed: () {
                      AppCubit.get(context).changeInCart(context, model, index);
                    },
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                  ),
                ),
                fallback: (context) => CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    onPressed: () {
                      cubit.changeInCart(context, model, index);
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (model.inCart == 1)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.add(model);
                      },
                      child: Container(
                        color: ColorManager.text_blue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2),
                          child: Text('+',
                              style: TextStyle(
                                  color: ColorManager.defultwhite,
                                  fontSize: FontSize.s18,
                                  fontWeight: FontWeightManager.bold)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 25,
                        height: 46,
                        decoration: BoxDecoration(
                          color: ColorManager.list,
                       borderRadius: BorderRadius.circular(12)
                            ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Center(
                          child: Text(
                       '${model.Quantity}',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                   cubit.sub(model);
                      },
                      child: Container(
                        color: ColorManager.text_blue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2),
                          child: Text('-',
                              style: TextStyle(
                                  color: ColorManager.defultwhite,
                                  fontSize: FontSize.s18,
                                  fontWeight: FontWeightManager.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
// Spacer(),
          Expanded(
            child: Container(
// width: MediaQuery.of(context).size.width - 140,
              height: 148,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        model!.itemId.toString(),
                      ),
//Text('125'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 65,
                          child: Text(
                            ': رقم المنتج',
                            style: TextStyle(
                                fontSize: FontSize.s12,
                                color: ColorManager.text_blue,
                                fontWeight: FontWeightManager.semiBold),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 65,
                          child: Text(
                            ': اسم المنتج',
                            style: TextStyle(
                                fontSize: FontSize.s12,
                                color: ColorManager.text_blue,
                                fontWeight: FontWeightManager.semiBold),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          model.itemName.toString(),
                          maxLines: 3,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        model.priceitem.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
//Text('125'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 65,
                          child: Text(
                            ': سعر المنتج',
                            style: TextStyle(
                                fontSize: FontSize.s12,
                                color: ColorManager.text_blue,
                                fontWeight: FontWeightManager.semiBold),
                          )),
//SizedBox(width: 5,),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      if (model.specialPrice.toString() == 'null') Text('0'),
                      if (model.specialPrice.toString() != 'null')
                        Text(model.specialPrice.toString()),
//Text('125'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 65,
                          child: Text(
                            ': سعر خاص',
                            style: TextStyle(
                                fontSize: FontSize.s12,
                                color: ColorManager.text_blue,
                                fontWeight: FontWeightManager.semiBold),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      if (model.balance.toString() == 'null') Text('0'),
                      if (model.balance.toString() != 'null')
                        Text(model.balance.toString()),

//Text('125'),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 65,
                          child: Text(
                            ': الرصيد',
                            style: TextStyle(
                                fontSize: FontSize.s12,
                                color: ColorManager.text_blue,
                                fontWeight: FontWeightManager.semiBold),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
}
