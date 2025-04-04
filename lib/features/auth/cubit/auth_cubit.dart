import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practical_google_maps_example/core/constants/constants.dart';
import 'package:practical_google_maps_example/features/auth/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  void loginUser({required String email,required String password})async{
    emit(AuthLoading());
    final result=await authRepo.loginUser(email: email, password: password);
    result.fold((failure)=>emit(AuthFailure(errorMsg:failure)),(userModel){
      UserData.userModel=userModel;
      emit(AuthSuccess(msg:'Login Successfully'));
    });
  }
  void createUser({required String userName,required String email,required String password})async{
    var result=await authRepo.registerUser(userName: userName, email: email, password: password);
    result.fold((failure){
      emit(AuthFailure(errorMsg: failure));
    }, (success){emit(AuthSuccess(msg:'user registered successfully' ));});
}
}
