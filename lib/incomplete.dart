import 'package:flutter/material.dart';

class Incomplete extends StatefulWidget {
  const Incomplete({super.key});

  @override
  State<Incomplete> createState() => _IncompleteState();
}

class _IncompleteState extends State<Incomplete> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No data, please create the task new',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
