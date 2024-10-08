import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  final T? success;
  final Object? failure;

  const Result({
    this.success,
    this.failure,
  });

  factory Result.success(T result) => Result(success: result);
  factory Result.failure(Object failure) => Result(failure: failure);

  void when(Function(T) success, Function(Object) failure) {
    if (this.success != null && this.success is T) {
      success(this.success as T);
    } else if (this.failure != null) {
      failure(this.failure!);
    }
  }

  @override
  List<Object?> get props => [
        success,
        failure,
      ];
}
