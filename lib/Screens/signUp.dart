import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/allergypage.dart';
import 'package:flutter_application_2/Screens/homepage.dart';
import 'package:flutter_application_2/Screens/signIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController passwordController = TextEditingController();

  bool isSecured = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 236, 209, 236),
          centerTitle: true,
          title: const Text(
            "create your account: ",
            style: TextStyle(fontSize: 25,   color: Color.fromARGB(255, 26, 11, 120),
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
                          decoration: const InputDecoration(
                            label: Text("username:"),
                            prefixIcon: Icon(Icons.person),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.email),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Mobile Number "),
                            prefixIcon: Icon(Icons.mobile_friendly_outlined),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "Date of Birth",
                                  style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SizedBox(
                                width: 70.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 10.0,
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: 'DD',
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: 70.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 10.0,
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: 'MM',
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: 70.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 10.0,
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: 'YY',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
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
                         onTap: (){
                    Navigator.push(context,MaterialPageRoute( builder: (context) => Allergypage() ),
                                            );
                                            },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 59, 94, 154),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  "Sign UP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
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
                            text: "Do have an account? ",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign in now!',
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
                                        builder: (context) => SignIn(),
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
      ),
    );
  }
}
