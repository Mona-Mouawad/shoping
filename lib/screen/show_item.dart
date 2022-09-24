import 'package:buildcondition/buildcondition.dart';
import 'package:elsendbad/DataBase/database.dart';
import 'package:elsendbad/shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elsendbad/cubit/cubit.dart';
import 'package:elsendbad/cubit/states.dart';
import 'package:elsendbad/screen/search.dart';
import 'package:elsendbad/shared/component.dart';

import '../DataBase/get.dart';

class show_screen extends StatelessWidget {
  const show_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, states>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.primary,
            appBar: AppBar(
              // leading: IconButton(
              //   onPressed: () {
              //     cubit.checkConnection();
              //   },
              //   icon: Icon(Icons.refresh),
              // ),
              elevation: 10,
              centerTitle: true,
              title: Text('المنتجات'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      onPressed: () {
                        cubit.items_Search=[] ;
                        NavigatorTo(context, Search_screen());
                      },
                      child: Row(
                        children: [
                          Text(
                            'بحث',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Icon(Icons.search, size: 16, color: Colors.white),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: BuildCondition(
              condition: items_data.length > 0,
              builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: builditem(model: items_data[index], context: context),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 2,
                ),
                itemCount: items_data.length,
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
