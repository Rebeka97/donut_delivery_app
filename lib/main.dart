import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:donuts_app/app.dart';
import 'package:donuts_app/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseOptions = defaultTargetPlatform == TargetPlatform.windows
      ? const FirebaseOptions(
          apiKey: 'AIzaSyCho0zHhMqUVft-HxSrQy7VNdom26F1Ee0',
          appId: '1:283968620955:android:a97eebc1d2667f36c6393e',
          messagingSenderId: '283968620955',
          projectId: 'donut-delivery-316e4',
          storageBucket: 'donut-delivery-316e4.firebasestorage.app',
        )
      : null;
  await Firebase.initializeApp(options: firebaseOptions);
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}

class MyApp extends StatelessWidget {
  final FirebaseUserRepo userRepo;

  const MyApp(this.userRepo, {super.key});

  @override
  Widget build(BuildContext context) {
    return MainApp(userRepo);
  }
}