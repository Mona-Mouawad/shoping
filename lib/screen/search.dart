import 'package:buildcondition/buildcondition.dart';
import 'package:elsendbad/screen/Items_Cart.dart';
import 'package:elsendbad/shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elsendbad/cubit/cubit.dart';
import 'package:elsendbad/cubit/states.dart';
import 'package:elsendbad/shared/component.dart';

class Search_screen extends StatelessWidget {
 // const Search_screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, states>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('بحث'),
              actions: [
                CircleAvatar(
                backgroundColor: ColorManager.darkGrey ,
                child: IconButton(onPressed: (){
                  cubit.GetItems_Card();
                  NavigatorTo(context, SOItems());
                 },
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,),
              ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            body:  Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  defultTextField(
                    context: context,
                    vaildate: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الاسم';
                      }
                    },
                    type: TextInputType.text,
                    labal:'ابحث برقم او اسم المنتج',
                    prefix: Icons.search,
                    onchange: (v)
                    {cubit.Search(value:  v);},
                    onsubmit:   (v)
                    {cubit.Search(value:  v);},
                  ),
                  SizedBox(height: 10,),
                  if (state is LoadingSearchState) LinearProgressIndicator(),
                  SizedBox(
                    height: 10.0,
                  ),
                    BuildCondition(
                      condition: cubit.items_Search.length > 0 || state is !LoadingSearchState ,
                      builder: (context)=> Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder:(context,index)=>
                              Container(child: builditem(model: cubit.items_Search[index],context: context,
                              index: index , search:  true ),color: ColorManager.primary,) ,
                          separatorBuilder:(context,index)=> myDivited(),
                          itemCount:cubit.items_Search.length,
                        ) ,
                      ),

                      fallback: (context)=> Expanded(child: Center(child: CircularProgressIndicator())),

                    )
                ],
              ),

            ),

          );
        }
    );
  }
}
