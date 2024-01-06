import 'package:shop_app_flutter_udemy/pages/notifier/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier{

  @override
  RegisterState build(){
    return RegisterState();
  }
  void onUserNameChanged(String name){
      state = state.copyWith(userName: name);
  }
  void onUserEmailChanged(String email){
    state = state.copyWith(email: email);
  }
  void onUserPasswordChanged(String password){
    state = state.copyWith(password: password);
  }
  void onUserRePasswordChanged(String rePassword){
    state = state.copyWith(rePassword: rePassword);
  }
}