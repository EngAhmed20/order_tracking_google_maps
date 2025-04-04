
import 'package:get_it/get_it.dart';
import 'package:practical_google_maps_example/features/auth/cubit/auth_cubit.dart';
import 'package:practical_google_maps_example/features/auth/repo/auth_repo.dart';

GetIt sl=GetIt.instance;
Future<void>initDI()async{
  sl.registerSingleton<AuthRepo>(AuthRepo());
  sl.registerSingleton<AuthCubit>(AuthCubit(sl.get<AuthRepo>()));


}