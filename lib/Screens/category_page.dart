import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitor_counting_system/Components/category_card.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future<String> readField(String fieldName) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    // Access a specific field in the document
    var specificFieldValue = snapshot.get(fieldName);

    return specificFieldValue;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenhight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(70)),
                    color: Colors.red.shade300),
                height: screenhight * 0.25,
                child: Container(
                  child: Column(children: [
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18, right: 10),
                          child: IconButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                              },
                              icon: Icon(Icons.menu)),
                        ),
                        Container(
                            width: screenWidth * 0.75,
                            child: SearchBar(
                              leading: Icon(Icons.search),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 59,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  "Hello, ",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data?['fullname'],
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        );
                                      } else {
                                        return Text(
                                          "Loading...",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }
                                    }),
                              ],
                            ),
                          ),
                        )),
                  ]),
                ),
              ),
            ),
            Container(
              height: screenhight * 0.75,
              child: Column(
                children: [
                  Row(
                    children: [
                      CategoryCard(
                        background: Colors.brown.shade200,
                        title: "Restaurent",
                        icon: Icon(Icons.restaurant),
                      ),
                      CategoryCard(
                        background: Colors.brown.shade200,
                        title: "Cafe",
                        icon: Icon(Icons.coffee),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CategoryCard(
                        background: Colors.brown.shade200,
                        title: "Supermarket",
                        icon: Icon(Icons.business_outlined),
                      ),
                      CategoryCard(
                        background: Colors.brown.shade200,
                        title: "Mall",
                        icon: Icon(Icons.shopping_cart),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CategoryCard(
                        background: Colors.brown.shade200,
                        title: "Cinema",
                        icon: Icon(Icons.movie_creation_outlined),
                      ),
                      CategoryCard(
                        background: Colors.brown.shade200,
                        title: "Meuseum",
                        icon: Icon(Icons.account_balance_sharp),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}