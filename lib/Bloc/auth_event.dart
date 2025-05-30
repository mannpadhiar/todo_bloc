part of 'auth_bloc.dart';

sealed class AuthEvent{

}

class AuthLoginRequested extends AuthEvent{
  final String email;
  final String password;

  AuthLoginRequested({required this.email,required this.password});
}

class AuthLogOutRequested extends AuthEvent{}