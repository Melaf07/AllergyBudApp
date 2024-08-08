import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/realhome.dart';

void main() {
  runApp(const Allergypage());
}

class Allergypage extends StatefulWidget {
  const Allergypage({super.key});

  @override
  AllergyListState createState() => AllergyListState();
}

class AllergyListState extends State<Allergypage> {
  List<String> chosenAllergies = [
    "beanut butter",
    "eggs",
    "cow's milk",
    "sea food",
    "wheat",
    "banana",
    "avocado",
    "corn",
    "orange"
  ];
  List<String> allergyOptions = [];
  String? selectedAllergy;

  void handleAddAllergy() {
    if (selectedAllergy != null) {
      setState(() {
        chosenAllergies.add(selectedAllergy!);
        allergyOptions.remove(selectedAllergy);
        selectedAllergy = null;

      });
    }
  }

  Widget allergyCard(String imagePath, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom:16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1.5,
            color: Color.fromARGB(255, 113, 46, 220),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imagePath),
              ),
            ),
            SizedBox(width: 10), // Add some space between the image and the text
            Text(
              text,
              style: TextStyle(
                color: const Color.fromARGB(213, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(), // Push the button to the end
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: handleAddAllergy,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(6),
                  ),
                  child: const CircleAvatar(
                    radius: 13,
                    backgroundColor: Color.fromARGB(255, 217, 170, 241),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 236, 209, 236),
          title: const Text(
            "What allergic do you \nsuffer from?",
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
              ),  child: SingleChildScrollView( 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Search"),
                            prefixIcon: Icon(Icons.search),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        allergyCard("assets/image/PB.PNG", chosenAllergies[0]),
                        allergyCard("assets/image/eggs.PNG", chosenAllergies[1]),
                       allergyCard("assets/image/milk.PNG", chosenAllergies[2]),
                        allergyCard("assets/image/fish.PNG", chosenAllergies[3]),
                        allergyCard("assets/image/wheat.PNG", chosenAllergies[4]),
                        allergyCard("assets/image/banana.PNG", chosenAllergies[5]),
                        allergyCard("assets/image/avocado.PNG", chosenAllergies[6]),
                        allergyCard("assets/image/corn.PNG", chosenAllergies[7]),


                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                   Center(
            child: InkWell(
              onTap: () {

                    Navigator.push(context,MaterialPageRoute( builder: (context) =>  Realhome() ),
                                            );
                                                 },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 94, 154),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "done",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                              ],
                            ),
                          ),
                        ),
                 ),   ],
              ),
            ),
         ), ],
        ),
      ),
    );
  }
}