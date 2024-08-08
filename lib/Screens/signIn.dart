import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/allergypage.dart';
import 'package:flutter_application_2/Screens/homepage.dart';
import 'package:flutter_application_2/Screens/signUp.dart';
import 'package:flutter_application_2/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  State<SignIn> createState() => SignInState();
}


class SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSecured = true;
  Map<String, User> users = {
    "melaf": User(email: "melaf", password: "1234"),
    "nony": User(email: "nony", password: "abcd"),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 236, 209, 236),
            centerTitle: true,
            title: const Text(
              "Login in to your account: ",
              style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 26, 11, 120),
),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 0, 8, 10)),
            ),
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 236, 209, 236),
                      Color.fromARGB(255, 167, 207, 224),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              label: Text("Enter Email"),
                              prefixIcon: Icon(Icons.person),
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                            ),
                          ),
                          const SizedBox(height: 40),
                          TextFormField(
                            controller: passwordController,
                            obscureText: isSecured,
                            decoration: InputDecoration(
                              label: const Text("Enter Password"),
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSecured = !isSecured;
                                  });
                                },
                                icon: Icon(
                                  isSecured
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide()),
                            ),
                          ),
                          const SizedBox(height: 40),
                          InkWell(
                            onTap: () {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();

                              // Debugging print statements
                              print('Input email: "$email"');
                              print('Input password: "$password"');

                              User? user = users[email];

                              // Print the retrieved user and its details
                              print('Retrieved user: $user');
                              if (user != null) {
                                print('Retrieved user email: ${user.email}');
                                print(
                                    'Retrieved user password: ${user.password}');
                              }

                              if (user != null && password == user.password) {
                                print('logged');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Allergypage()),
                                );
                              } else {
                                print('email or password is wrong');
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Login Failed'),
                                    content: const Text(
                                        'Email or password is incorrect.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 59, 94, 154),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.google,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Icon(Icons.fingerprint, size: 30)
                            ],
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign up now!',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to the SignUp page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUp(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
