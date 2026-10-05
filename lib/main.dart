import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/users_cubit.dart';
import 'screens/login_screen.dart';
import 'services/user_api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide UsersCubit across the app widget tree
    return BlocProvider<UsersCubit>(
      create: (context) => UsersCubit(UserApiService()),
      child: MaterialApp(
        title: 'Users Directory',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            scrolledUnderElevation: 2,
            centerTitle: false,
          ),
          cardTheme: const CardThemeData(elevation: 0),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
