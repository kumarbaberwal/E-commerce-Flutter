import 'package:cubit_form/cubit_form.dart';
import 'package:ecommerce/core/configs/theme/app_theme.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce/presentation/splash/pages/splash_page.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
