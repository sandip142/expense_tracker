import 'dart:math';

import 'package:expense_tracker/screen/home/views/main_body.dart';
import 'package:expense_tracker/screen/stats/view/stat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
    int index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value){
             setState(() {
               index=value;
             });
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.green),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book,), label: "stats")
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration:  BoxDecoration(
            shape:BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary
              ],
              transform: const GradientRotation(pi/4)
            ),
          ),
          child:const Icon(CupertinoIcons.add),
          
        ),
      ),
      body: index==0? const MainBody(): const StatsScreen(),
    );
  }
}
