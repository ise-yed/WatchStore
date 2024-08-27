import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/theme.dart';
import 'package:watch_store/data/repo/cart_repo.dart';
import 'package:watch_store/data/repo/home_repo.dart';
import 'package:watch_store/data/repo/product_repo.dart';
import 'package:watch_store/data/repo/profile_repo.dart';
import 'package:watch_store/route_manager/routes.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:watch_store/screens/home/bloc/home_bloc.dart';
import 'package:watch_store/screens/product_list/bloc/product_list_bloc.dart';
import 'package:watch_store/screens/product_single/bloc/product_single_bloc.dart';
import 'package:watch_store/screens/profile/bloc/profile_bloc.dart';
import 'package:watch_store/screens/register/cubit/register_cubit.dart';
import 'package:watch_store/utils/shared_preferences_constant.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesManager().init();

  String? token =
  SharedPreferencesManager().getString(SharedPreferencesConstant.token);
  debugPrint('Bearer $token');

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(),
    ),
    BlocProvider(
      create: (context) => HomeBloc(homeRepository),
    ),
    BlocProvider(create: (context) => RegisterCubit()),
    BlocProvider(create: (context) => ProductListBloc(productRepository)),
    BlocProvider(
      create: (context) => ProductSingleBloc(productRepository),
    ),
    BlocProvider(
      create: (context) => CartBloc(cartRepository),
    ),
    BlocProvider(
      create: (context) => ProfileBloc(profileRepository),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WatchStore',
      theme: lightTheme(),
      //home: SendOtpScreen(),
      initialRoute: ScreenNames.root,
      routes: routes,
    );
  }
}
