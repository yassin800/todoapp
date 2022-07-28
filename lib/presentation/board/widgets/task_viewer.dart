import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/bloc/databasecubit.dart';
import 'package:todo_app/data/bloc/databasestate.dart';

// ignore: must_be_immutable
class TaskViewer extends StatelessWidget {
  bool value;
  TaskViewer({Key? key, this.value = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBaseCubit, DataBaseStates>(
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: value,
              onChanged: (value) {},
              checkColor: Colors.red,
              activeColor: Colors.blue,
            ),
            Text(
              '${DataBaseCubit.get(context).alltasks[0]['title']}',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
