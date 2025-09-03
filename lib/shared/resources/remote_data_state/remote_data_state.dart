import 'package:dio/dio.dart';

abstract class RemoteDataState<T> {
  final T? data;
  final DioException? error;

  const RemoteDataState({this.data, this.error});
}

class RemoteDataSuccess<T> extends RemoteDataState<T> {
  const RemoteDataSuccess(T data) : super(data: data);
}

class RemoteDataFailed<T> extends RemoteDataState<T> {
  const RemoteDataFailed(DioException error) : super(error: error);
}
