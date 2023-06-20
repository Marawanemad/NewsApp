import 'package:dio/dio.dart';

// class to use dio to interact with api
class DioHelper {
// declare static variable from type Dio
  static Dio? dio;
// make init method to intialize variable and api location
  static init() {
    // intialize the varriable dio and give it constractor Dio()
    dio = Dio(
      // this constractor take object baseoptions() to intialize in it baseurl
      BaseOptions(
        // baseUrl that lead us to server which store api data on it
        baseUrl: 'https://newsapi.org/',
        // this make app return data untill error happened when call data
        receiveDataWhenStatusError: true,
      ),
    );
  }

// make get method and take path and query parameters to get what data we want when we call it
  static Future<Response> getData({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    // give it the path and query(key:value) to return data that we want
    return await dio!.get(path, queryParameters: query);
  }
}
