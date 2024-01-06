import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'global_loader.g.dart';

@riverpod
class AppLoader extends _$AppLoader{
  @override
  bool build(){
    return false;
  }

  void setLoader(bool isLoading){
    state = isLoading;
  }
}