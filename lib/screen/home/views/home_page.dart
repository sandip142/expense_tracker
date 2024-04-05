import 'dart:math';

import 'package:expense_tracker/screen/Expenses/view/expense_add.dart';
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
  int index = 0;
  @override
  void initState() {
    setState(() {
      if (index == 1) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              icon:const Icon(CupertinoIcons.home),
              label: "Home",
              backgroundColor: index == 0 ? Colors.green : Colors.black,
            ),
            BottomNavigationBarItem(
              icon:const Icon(CupertinoIcons.book),
              label: "stats",
              backgroundColor: index == 1 ? Colors.green : Colors.black,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpenses(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.tertiary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary
            ], transform: const GradientRotation(pi / 4)),
          ),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      body: index == 0 ? const MainBody() : const StatsScreen(),
    );
  }
}
