import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Screens/signIn.dart';
import 'package:flutter_application_2/Screens/signUp.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 217, 234),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 209, 236),
        title: const Text(
          " Your Health \nCompanion :)",
          style: TextStyle(
            fontSize: 25, // fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 26, 11, 120),
          ),
        ),
        actions: const [
          Icon(Icons.star_border),
          Icon(Icons.star),
          Icon(Icons.star)
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 236, 209, 236),
            Color.fromARGB(255, 167, 207, 224),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/aa.png",
              height: 450,
              width: 450,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                    Navigator.push(context,MaterialPageRoute( builder: (context) => SignUp() ),
                                            );
                                            },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 94, 154),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up        ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                    Navigator.push(context,MaterialPageRoute( builder: (context) => const SignIn() ),
                                            );
                                            },
                                          
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 94, 154),
                        borderRadius: BorderRadius.circular(15),),
                        
                     child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign in          ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                           
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
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
