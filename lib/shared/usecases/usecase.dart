abstract interface class UseCase<T, Params> {
  Future<T> call({Params params});
}
