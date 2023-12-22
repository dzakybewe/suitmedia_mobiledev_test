import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_mobiledev_test/ui/first_screen.dart';
import 'package:suitmedia_mobiledev_test/ui/second_screen.dart';
import 'package:suitmedia_mobiledev_test/ui/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          titleTextStyle: ThemeData.light().textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true
        )
      ),
      initialRoute: FirstScreen.routeName,
      routes: {
        FirstScreen.routeName : (context) => const FirstScreen(),
        SecondScreen.routeName : (context) => SecondScreen(
          name: ModalRoute.of(context)?.settings.name as String,
        ),
        ThirdScreen.routeName : (context) => const ThirdScreen()
      },
    );
  }
}
