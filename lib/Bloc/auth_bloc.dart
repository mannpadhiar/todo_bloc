import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) {
      final email = event.email;
      final password = event.password;

      if(password.length < 6){
        emit(AuthFailure('Password cannot be less then six character'));
        return;
      }
    },);
  }
}