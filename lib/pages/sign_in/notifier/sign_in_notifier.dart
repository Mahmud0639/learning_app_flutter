import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/notifier/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super(const SignInState());//to make a constructor of that class is extends the parent class

  void onUserEmailChange(String email){
    state = state.copyWith(email: email);
  }

  void onUserPasswordChange(String password){
    state = state.copyWith(password: password);
  }

}

final signInNotifierProvider = StateNotifierProvider<SignInNotifier,SignInState>((ref) => SignInNotifier());//to access the state of this SignInNotifier we need this line