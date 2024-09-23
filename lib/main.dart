import 'package:bookstore_app/core/common/providers/auth_state_provider.dart';
import 'package:bookstore_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bookstore_app/core/constants/app_colors.dart';
import 'package:bookstore_app/view/auth/welcome_screen.dart';

import 'package:bookstore_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  await ScreenUtil.ensureScreenSize();

  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider.future).asStream();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: AppColors.secondaryColor,
            scrolledUnderElevation: 0,
            elevation: 0,
          ),
          scaffoldBackgroundColor: AppColors.secondaryColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionHandleColor: Colors.blue,
            selectionColor: Colors.lightBlue.withOpacity(0.3),
          ),
          textTheme: Theme.of(context).textTheme.copyWith(
                headlineLarge: GoogleFonts.openSans().copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
                headlineMedium: GoogleFonts.openSans().copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
                titleLarge: GoogleFonts.openSans().copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                titleMedium: GoogleFonts.openSans().copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                titleSmall: GoogleFonts.openSans().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                bodyMedium: GoogleFonts.openSans().copyWith(
                  fontSize: 16.sp,
                ),
                bodySmall: GoogleFonts.openSans().copyWith(
                  fontSize: 14.sp,
                  // letterSpacing: -0.41,
                  // wordSpacing: 1,
                ),
                displaySmall: GoogleFonts.openSans().copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w300,
                ),
                labelSmall: GoogleFonts.openSans().copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
        ),
        home: StreamBuilder(
          stream: user,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const WelcomeScreen();
            }

            return const HomeScreen();
          },
        ),
      ),
    );
  }
}
