import 'package:dio/dio.dart';
 class DioHelper
{
 static var dio = Dio();
  
 static init()
 {
   dio = Dio(
     BaseOptions(baseUrl:'http://loft11174.serverprofi24.com:7007/Sendbad.API/rest/1/item/' ,
     receiveDataWhenStatusError: true
     )
   );
 }
 
 static Future<Response> getdata(
   {
     required String url,
      Map<String,dynamic>? query,
   }
 )
 {
   return dio.get(url,queryParameters: query);
 }

}