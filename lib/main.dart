import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/issues_bloc/issues_bloc.dart';
import 'bloc/repo_bloc/repo_bloc.dart';
import 'bloc/users_bloc/users_bloc.dart';
import 'ui/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Sejutacita Test Case',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF1c1a4e),
            secondary: const Color(0xFFffc500),
          ),
          scaffoldBackgroundColor: const Color(0xFFffffff),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UsersBloc(),
            ),
            BlocProvider(
              create: (context) => RepoBloc(),
            ),
            BlocProvider(
              create: (context) => IssuesBloc(),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
