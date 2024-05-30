// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_ui/util/coffee_tile.dart';
import 'package:coffee_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  // [ coffe type, isSelected]
  final List coffeeType = [
    ['Cappucino', true,],
    ['espresso', false,],
    ['ristretto', false,],
    ['latte', false,],
    ['lungo', false,],


  ];

  // user taps on the coffee types

  void coffeeTypeSelected(int index){
    setState((){
      //  for loop for the text
      for( int i=0; i<coffeeType.length; i++ ){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Icon(Icons.menu),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 28),
                child: Icon(Icons.person),
              )
            ]),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ]),

        // Body
        body: Column(children: [
          // find the best
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Cozy up with coffee this season! ☕",
              style: GoogleFonts.cairoPlay(
                fontSize: 32,
                color: Color.fromRGBO(229, 184, 11, 1.0),
              ),
            ),
          ),
          SizedBox(height: 25),
          //  search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your coffee ..",
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50)),
              ),
            ),
          ),

          SizedBox(height: 25),
          
          // Horizontal listview of coffee tiles -> using expanded widget
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
            itemBuilder: (context, index){
            return CoffeeType(coffeeType: coffeeType[index][0],
             isSelected: coffeeType[index][1],
             onTap: (){
              coffeeTypeSelected(index);
             },
            );

          })
        
        ),


          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cap3.jpg',
                  coffeeName: 'Espresso',
                  coffeePrice: '200',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cap2.jpg',
                  coffeeName: 'Vanilla Latte',
                  coffeePrice: '320',
                ),
                
                 CoffeeTile(
                  coffeeImagePath: 'lib/images/cap1.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '280',
                ),


              ]
            )
          )

        ]));
  }
}
