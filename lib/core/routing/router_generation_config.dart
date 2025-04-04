import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:practical_google_maps_example/core/routing/app_routes.dart';
import 'package:practical_google_maps_example/features/auth/cubit/auth_cubit.dart';
import 'package:practical_google_maps_example/features/auth/login_screen.dart';
import 'package:practical_google_maps_example/features/auth/register_screen.dart';
import 'package:practical_google_maps_example/features/auth/repo/auth_repo.dart';
import 'package:practical_google_maps_example/features/home/home_scr.dart';
import 'package:practical_google_maps_example/features/orders/add_orders_scr.dart';
import 'package:practical_google_maps_example/features/orders/orders_scr.dart';
import 'package:practical_google_maps_example/features/splash_screen/splash_screen.dart';

import '../di/dependency_injection.dart';

class RouterGenerationConfig {
  static GoRouter goRouter =
      GoRouter(initialLocation: AppRoutes.splashScreen, routes: [
    GoRoute(
      name: AppRoutes.splashScreen,
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: AppRoutes.loginScreen,
      path: AppRoutes.loginScreen,
      builder: (context, state) => BlocProvider(
          create: (context)=>AuthCubit(sl.get<AuthRepo>()),
          child: const LoginScreen()),
    ),
    GoRoute(
      name: AppRoutes.registerScreen,
      path: AppRoutes.registerScreen,
      builder: (context, state) => BlocProvider(
          create: (context)=>AuthCubit(sl.get<AuthRepo>()),
          child: const RegisterScreen()),
    ),
    GoRoute(path: AppRoutes.mainScreen,
    name: AppRoutes.mainScreen,
      builder: (context,state)=>const HomeScr(),
    ),
        GoRoute(path: AppRoutes.ordersScreen,
          name: AppRoutes.ordersScreen,
          builder: (context,state)=>const OrdersScr(),
        ),
        GoRoute(path: AppRoutes.addOrdersScreen,
          name: AppRoutes.addOrdersScreen,
          builder: (context,state)=>const AddOrdersScr(),
        ),
      ]);
}
