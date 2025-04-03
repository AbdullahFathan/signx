part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, empty, eror }

class RegisterState {
  const RegisterState({
    required this.data,
    required this.status,
    required this.eror,
  });

  final RegisterStatus status;
  final String eror;

  final User? data;

  factory RegisterState.initial() =>
      const RegisterState(data: null, status: RegisterStatus.initial, eror: "");

  RegisterState copyWith({User? data, RegisterStatus? status, String? eror}) {
    return RegisterState(
      data: data ?? this.data,
      status: status ?? this.status,
      eror: eror ?? this.eror,
    );
  }
}
