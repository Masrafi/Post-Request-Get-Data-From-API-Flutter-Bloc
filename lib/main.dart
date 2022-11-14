import 'package:apicalling/bloc/api_bloc.dart';
import 'package:apicalling/repo/repository.dart';
import 'package:apicalling/screen/email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ApiBloc(Repository()),
        child: const EmailScreen(),
      ),
    );
  }
}
