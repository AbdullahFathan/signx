enum BaseStatus { initial, loading, success, empty, error }

class BaseState<T> {
  const BaseState({
    required this.status,
    required this.data,
    required this.error,
  });

  final BaseStatus status;
  final T? data;
  final String error;

  factory BaseState.initial() =>
      BaseState<T>(status: BaseStatus.initial, data: null, error: "");

  BaseState<T> copyWith({BaseStatus? status, T? data, String? error}) {
    return BaseState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
