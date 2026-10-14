import 'package:donuts_app/app.dart';
import 'package:donuts_app/core/config/firebase_config.dart';
import 'package:donuts_app/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: defaultTargetPlatform == TargetPlatform.windows
        ? FirebaseConfig.windows
        : null,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MainApp(FirebaseUserRepo()));
}
