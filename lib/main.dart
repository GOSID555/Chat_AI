import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qna_ai/views/home.dart';
import 'package:qna_ai/views/splash.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home:  Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
