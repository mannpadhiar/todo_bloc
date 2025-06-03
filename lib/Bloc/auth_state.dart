part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState{
  final String uid;

  AuthSuccess({required this.uid});
}

class AuthFailure extends AuthState{
  final String errorMessage;

  AuthFailure(this.errorMessage);
}

class AuthLoading extends AuthState{}