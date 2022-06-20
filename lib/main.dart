import 'package:awesome_app/common/constant/constant.dart';
import 'package:awesome_app/common/constant/styles.dart';
import 'package:awesome_app/common/helper/routes.dart';
import 'package:awesome_app/controllers/list_image/list_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<ListImageBloc>()),
      ],
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kBlue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: kTextTheme.apply(
            displayColor: kSecondaryBlue,
            bodyColor: kBlack,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(fixedSize: const Size.fromHeight(35)),
          ),
        ),
        onGenerateRoute: generateRoute,
        initialRoute: homeRoute,
      ),
    );
  }
}
