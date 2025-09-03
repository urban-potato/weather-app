abstract class LocalDataState<T> {
  final T? data;
  final Object? error;

  const LocalDataState({this.data, this.error});
}

class LocalDataSuccess<T> extends LocalDataState<T> {
  const LocalDataSuccess(T data) : super(data: data);
}

class LocalDataFailed<T> extends LocalDataState<T> {
  const LocalDataFailed(Object error) : super(error: error);
}
