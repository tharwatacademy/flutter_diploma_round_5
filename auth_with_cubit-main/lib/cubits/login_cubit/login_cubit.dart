import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await Future.delayed(Duration(seconds: 2), () {});
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(message: "Login Failed Try Again"));
    }
  }
}
