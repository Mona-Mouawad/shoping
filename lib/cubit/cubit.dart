import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elsendbad/cubit/states.dart';
import 'package:elsendbad/model/ItemsModel.dart';
import '../DataBase/database.dart';
import '../DataBase/get.dart';
import '../shared/content.dart';

class AppCubit extends Cubit<states>{
  AppCubit() : super(initstates());

  static AppCubit get(context)=>BlocProvider.of(context);

  getItems() async {
    await getDatabase(database);
   Future.delayed(Duration(seconds: 2),() {
      emit(Successloginstate());
    });
  }

  List<Items> items_Search=[];
  void Search({required String value})
  {
    items_Search=[];
    emit(LoadingSearchState());
    items_data.forEach((element) {
      if(value !=''){
        if(element.itemId.toString().contains(value)||element.itemName.toString().toUpperCase().contains(value.toUpperCase()))
        {
         // element.inCart = false ;
          items_Search.add(element);
        }
      }
    }
    );
    print("   items_Search.length  "+ items_Search.length.toString());
      emit(SuccessSearchState());
  }


  void changeInCart(context , Items items , index )
  {
   items.inCart == 0 ?  items.inCart = 1 : items.inCart = 0 ;
   emit(ChangeInCartstate());
   items.inCart  == 1  ?  openmessageInCart(context) : openmessageOutCart(context) ;
  }

  void add(Items items) {
    items.Quantity += 1;
    emit(Addstate());
  }
  void sub(Items items) {
    if (items.Quantity > 1) {
      items.Quantity -= 1;
    }
    emit(Substate());
  }

  dynamic Result = 0 ;
  List<Items> items_Card = [];
  void GetItems_Card()
  { Result = 0 ;
    items_Card=[];
    emit(LoadingGetItems_CardState());
    items_data.forEach((element) {
        if(element.inCart == 1 )
        {
          items_Card.add(element);
          Result +=  element.Quantity *  element.specialPrice ;
        }
    }
    );
    print("   items_Card.length  "+ items_Card.length.toString());
    emit(SuccessGetItems_CardState());
  }

  void UpdateItems_Card()
  {
  emit(LoadingGetItems_CardState());
  items_data.forEach((element) {
    if(element.inCart == 1 )
    {element.inCart = 0  ;
    }
  }
  );
  print("   items_Card.length  "+ items_Card.length.toString());
  emit(SuccessGetItems_CardState());
  }

}
