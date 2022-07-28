import 'package:flutter/material.dart';
import 'package:todo_app/presentation/add_task/widgets/field.dart';

import '../../components/add_button.dart';
import '../../data/bloc/databasecubit.dart';

class AddTaskwidget extends StatefulWidget {
  AddTaskwidget({Key? key}) : super(key: key);

  @override
  State<AddTaskwidget> createState() => _AddTaskwidgetState();
}

class _AddTaskwidgetState extends State<AddTaskwidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController deadline = TextEditingController();
  TextEditingController starttime = TextEditingController();
  TextEditingController endtime = TextEditingController();
  TextEditingController remind = TextEditingController();
  TextEditingController repeat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Title',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Field(controller: titlecontroller, txt: 'Design team meating'),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Deadline',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Field(controller: deadline, txt: '2021-8-2'),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                const Text(
                  'Start time',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.3,
                ),
                const Text(
                  'End Time',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Field(controller: starttime, txt: '11:00 am')),
                Expanded(child: Field(controller: endtime, txt: '1:00 pm')),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Remind',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Field(controller: remind, txt: '2021-8-2'),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Reapeat',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Field(controller: repeat, txt: '2021-8-2'),
            AddButton(
              txt: 'Create Task',
              function: () {
                DataBaseCubit.get(context).insertdatabase(
                    title: titlecontroller.text,
                    deadline: deadline.text,
                    startdate: starttime.text,
                    enddate: endtime.text,
                    reminder: remind.text,
                    repeat: repeat.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
