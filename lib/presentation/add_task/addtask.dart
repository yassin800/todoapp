import 'package:flutter/material.dart';
import 'package:todo_app/data/bloc/databasecubit.dart';
import 'package:todo_app/presentation/add_task/addtaskwidget.dart';

import '../../components/add_button.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: AddTaskwidget(),
      ),
    );
  }
}
