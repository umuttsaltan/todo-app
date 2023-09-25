import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/res/colors.dart';
import 'package:todoapp/features/authentication/app/user_provider.dart';
import 'package:todoapp/features/onboarding/views/onboarding_screen.dart';
import 'package:todoapp/features/todo/views/home_screen.dart';
import 'package:todoapp/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            scaffoldBackgroundColor: Colours.backgroundDark,
            useMaterial3: true,
          ),
          home: ref.watch(userProvider).when(
              data: (userExists) {
                if (userExists) return const HomeScreen();
                return const OnboardingScreen();
              },
              error: (error, stackTrace) {
                debugPrint('ERROR: $error');
                debugPrint(stackTrace.toString());
                return const OnboardingScreen();
              },
              loading: () {
                const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        );
      },
    );
  }
}
