
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practical_google_maps_example/features/auth/models/user_model.dart';

class AuthRepo{
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  Future<Either<String,String>> registerUser({required String userName, required String email,required String password})async{
try{
  UserCredential user=await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  String uId=user.user!.uid;
  log(user.user!.uid);
  await firestore.collection('users').doc(uId).set({
    'userName':userName,
    'email':email,
    'userId':uId,
  });
  return const Right('Account Created Successfully');

} on FirebaseAuthException catch (e) {
  log(e.message ?? "حدث خطأ غير معروف");
  return Left(e.message ?? "حدث خطأ غير معروف");
} catch (e) {
  log(e.toString());
  return Left(e.toString());
}
  }

  Future<Either<String,UserModel>> loginUser({required String email,required String password})async{
    try{
      UserCredential user=await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot<Map<String, dynamic>> data=await firestore.collection('users').doc(user.user!.uid).get();
      UserModel userModel=UserModel.fromJson(data.data()!);
      log(userModel.userName);
      return Right(userModel);

    }on FirebaseException catch(e){
      return Left(e.toString());
    }
    catch(e){
      log(e.toString());
      return Left("Error When Login: $e");

    }


}

}