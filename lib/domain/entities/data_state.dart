abstract class DataState<T> {
  const DataState({
    this.data,
    this.error,
  });

  final T? data;
  final String? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(
    String? error,
  ) : super(
          error: error,
        );
}

extension DataStateExtensions<T> on DataState<T> {
  bool isSuccess() => this is DataSuccess;
  bool isError() => this is DataFailed;
}
