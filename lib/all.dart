import 'dart:math';

import 'package:create_task/model/todo_list.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget {
  const All({super.key, required this.item});
  final TodoModel item;

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  int counter = 0;

  void incrementCouter() {
    setState(() {
      counter++;
    });
  }

  final List<TodoModel> listTodo = [];
  TextEditingController title = TextEditingController();
  var isCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  final result = await showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text('Create Task'),
                          content: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: title,
                                  decoration: const InputDecoration(
                                      hintText: 'Wrire task here ...'),
                                ),
                              ),
                              StatefulBuilder(// StatefulBuilder
                                  builder: (context, setState) {
                                return Checkbox(
                                  value: isCheckbox,
                                  activeColor: Colors.blue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      value = !isCheckbox;
                                    });
                                  },
                                );
                              }),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('SUBMIT'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  listTodo.add(TodoModel(title: title.text));
                                });
                              },
                            ),
                          ],
                        );
                      });
                },
                child: const Text(
                  'Create task',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: listTodo.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) {
                        final item = listTodo[i];
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
                                              listTodo.removeAt(i);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${listTodo[i].title}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Checkbox(
                                    value: listTodo[i].isCheckbox,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        value = !listTodo[i].isCheckbox;
                                      });
                                    },
                                  )
                                ]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
