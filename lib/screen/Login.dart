import 'dart:ui';

import 'package:buildcondition/buildcondition.dart';
import 'package:elsendbad/screen/show_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/LoginCubit.dart';
import '../cubit/states.dart';
import '../shared/component.dart';

class loginScreen extends StatelessWidget {
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController Phonecontroller = TextEditingController();
  var loginformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => Logincubit(),
        child: BlocConsumer<Logincubit, states>(
          listener: (context, state) {
            if(state is Successloginstate)
            { NavigatorAndFinish(context,
                      show_screen());
               }
          },
          builder: (context, state) {
            var cubit = Logincubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title:  Image(image: AssetImage('images/logo.jpeg'),
                ) ,
                backgroundColor: Colors.white,
              ),
              body:
              Center(
                child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                           // fit:StackFit.expand ,
                            children: [
                              SizedBox(height: 300 ,// MediaQuery.of(context).size.height * .5 ,
                                child: Image(image: AssetImage('images/login2.jpeg'),
                                   fit: BoxFit.fill,
                                 ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: loginformkey,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15),
                                      defultTextField(
                                        context: context,
                                        vaildate: (value) {
                                          if (value!.isEmpty) {
                                            return '???? ???????? ???????? ??????????';
                                          }
                                        },
                                        type: TextInputType.text,
                                        labal: '??????????',
                                        prefix: Icons.person,
                                        controller: Namecontroller,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      defultTextField(
                                          context: context,
                                          vaildate: (value) {
                                            if (value!.length != 11) {
                                              return '???? ???????? ???????? ?????? ?????????????? ????????';
                                            }
                                          },
                                          type: TextInputType.phone,
                                          labal: '?????? ??????????????',
                                          prefix: Icons.phone,
                                          controller: Phonecontroller,
                                          onsubmit: (value) {
                                            if (loginformkey.currentState!.validate()) {}
                                          }),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      BuildCondition(
                                        condition: state is !Loadingloginstate ,
                                        builder: (context) => defultButton(
                                            text: '?????????? ????????',
                                            ontap: () {
                                              if (loginformkey.currentState!.validate()) {
                                                cubit.Login(
                                                  context: context ,
                                                   Cust_Name:  Namecontroller.text,
                                                    Cust_Phone:  Phonecontroller.text);
                                              }
                                            }),
                                        fallback: (context) =>
                                            Center(child: CircularProgressIndicator()),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              ),
            );
          },
        ));
  }
}
