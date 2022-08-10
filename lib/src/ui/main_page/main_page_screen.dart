import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auths/src/ui/auth/login_screen.dart';
import 'package:firebase_auths/src/ui/auth/register_screen.dart';
import 'package:firebase_auths/src/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return HomeScreen();
          }
          else{
            return LoginScreen();
          }
        },
      ),
    );
  }
}
