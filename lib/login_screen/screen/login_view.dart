import 'package:flutter/material.dart';

import 'package:news_app/main_screen/screen/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            const Text('WELCOME TO OUR NEWS APP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('please choose your methos of login:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: usernameController,
                validator: (value) {
                  var specialChar = RegExp(r'^(?=.*?[!@#\$&*~?])');
                  if (value!.isEmpty) {
                    return "username cannot be empty";
                  } else if (value.length < 5) {
                    return "too short";
                  } else if (!specialChar.hasMatch(value)) {
                    return "must have a special character";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    label: Text('username'), border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  var capitalCase = RegExp(r'^(?=.*[A-Z])');
                  if (value!.isEmpty) {
                    return "password cannot be empty";
                  } else if (value.length < 5) {
                    return "too short";
                  } else if (!capitalCase.hasMatch(value)) {
                    return "u need a capital letter";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('password')),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString(
                      'username', usernameController.toString());
                  await prefs.setString(
                      'password', passwordController.toString());
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                      MaterialPageRoute(
                        builder: ( context) => const MainNews(),
                      ));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const SizedBox(
                height: 20,
                width: 100,
                child: Text(
                  'login',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Color(0xff1a1919),
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Divider(thickness: 3, color: Color(0xff1a1919)))
              ],
            ),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 35,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'))),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      const Text('login with google')
                    ],
                  ),
                )),
            const SizedBox(height: 15,),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/fb.png'))),
                    ),
                    const Text('login with facebook')
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               TextButton(onPressed: (){}, child: const Text("login as guest ?"))
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
