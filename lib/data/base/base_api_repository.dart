import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

import '../../utils/resources/data_state.dart';

abstract class BaseApiRepository {

  Future<DataState<T>> getStateOf<T> ({
    required Future<HttpResponse<T>> Function() request,
}) async {
    try{
      final httpResponse = await request();
      if(httpResponse.response.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.data);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions
        );
      }
    } on DioError catch(e) {
      return DataFailed(e);
    }
  }
}