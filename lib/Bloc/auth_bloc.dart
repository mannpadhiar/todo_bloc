import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try{
        final email = event.email;
        final password = event.password;

        if(password.length < 6){
          emit(AuthFailure('Password cannot be less then six character'));
          return;
        }

        await Future.delayed(const Duration(seconds: 1),() {
          return emit(AuthSuccess(uid: '$email-$password'));
        },);
      }catch(e){
        return emit(AuthFailure(e.toString()));
      }
    },);
    on<AuthLogOutRequested>((event, emit) async {
      emit(AuthLoading());
      try{
        await Future.delayed(const Duration(seconds: 1),() {
          return emit(AuthInitial());
        },);

      }
      catch(e){
        emit(AuthFailure('something went wrong in logOut'));
      }
    },);
  }
}