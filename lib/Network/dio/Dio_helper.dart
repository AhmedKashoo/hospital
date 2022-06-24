import 'package:dio/dio.dart';

class web{
  late Dio dio;
  web(){
    BaseOptions options=BaseOptions(
        baseUrl: 'https://gentle-reef-75516.herokuapp.com/',
        receiveDataWhenStatusError: true
    );
    dio=Dio(options);
  }
  Future<List<dynamic>>all()async{
    Response response=await dio.get('user');
    print(response.data.toString());
    return response.data;
  }
}
