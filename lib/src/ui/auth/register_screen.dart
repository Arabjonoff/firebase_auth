import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(left: 8),
                width: MediaQuery.of(context).size.width,
                height: 57,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'email'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(left: 8),
                width: MediaQuery.of(context).size.width,
                height: 57,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'password'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: MaterialButton(
                  color: Colors.indigo,
                  onPressed: sigInUp,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text('Login'),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future sigInUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }on FirebaseAuthException catch(e){
      print(e);
    }
  }
}
