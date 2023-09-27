import 'package:create_task/home.dart';
import 'package:create_task/model/todo_list.dart';
import 'package:flutter/material.dart';

class Incomplete extends StatefulWidget {
  const Incomplete({super.key, required this.item});
  final TodoModel item;

  @override
  State<Incomplete> createState() => _IncompleteState();
}

class _IncompleteState extends State<Incomplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: incomplete.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) {
                    final item = incomplete[i];
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: Text("Bạn có muốn xóa Job "),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          incomplete.removeAt(i);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok"))
                                ],
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${incomplete[i].title}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Checkbox(
                                value: incomplete[i].isCheckbox,
                                onChanged: (bool? value) {
                                  setState(() {
                                    incomplete[i].isCheckbox = value!;
                                  });
                                },
                              )
                            ]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
