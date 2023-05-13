import 'package:app_auth/features/tareas/domain/usecases/get_tarea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './features/tareas/presentation/bloc/tareas_bloc.dart';
import './features/tareas/presentation/pages/home_tarea.dart';
import 'usecase_config.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TareasBloc>(
          create: (BuildContext context) =>
              TareasBloc(getTareas: usecaseConfig.getTareaUseCase!),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mi aplicación',
        // iniciar ruta
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeTarea(),
        },
      ),
    );
  }
}
