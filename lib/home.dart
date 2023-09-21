import 'package:create_task/all.dart';
import 'package:create_task/complete.dart';
import 'package:create_task/incomplete.dart';
import 'package:create_task/model/todo_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> body = [
    const Complete(),
    All(
      item: TodoModel(),
    ),
    const Incomplete(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Task'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(null),
            label: 'Complete',
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: 'Incomplete',
          ),
        ],
      ),
    );
  }
}
