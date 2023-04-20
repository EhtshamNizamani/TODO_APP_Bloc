import 'package:bloc_api/services/app_routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/task_bloc.dart';
import 'screen/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // repositoryProvider Q1
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: AppRouter().onGanerateRoute,
      ),
    );
  }
}
