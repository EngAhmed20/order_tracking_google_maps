part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState{}
class AuthSuccess extends AuthState{
  final String msg;

  AuthSuccess({required this.msg});

}
class AuthFailure extends AuthState{
  final String errorMsg;

  AuthFailure({required this.errorMsg});

}
