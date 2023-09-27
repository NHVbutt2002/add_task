import 'package:create_task/home.dart';
import 'package:create_task/model/todo_list.dart';
import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  const Complete({super.key, required this.item});
  final TodoModel item;

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listcomplete.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) {
                    final item = listcomplete[i];
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
                                          listcomplete.removeAt(i);
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
                                '${listcomplete[i].title}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Checkbox(
                                value: listcomplete[i].isCheckbox,
                                onChanged: (bool? value) {
                                  setState(() {
                                    listcomplete[i].isCheckbox = value!;
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
