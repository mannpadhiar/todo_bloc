part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {

}

class AuthSuccess extends AuthState{}

class AuthFailure extends AuthState{}