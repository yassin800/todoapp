import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/bloc/databasecubit.dart';
import 'package:todo_app/data/bloc/databasestate.dart';
import 'package:todo_app/presentation/add_task/addtask.dart';
import 'package:todo_app/presentation/board/board.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBaseCubit()..opendatabase(),
      child: BlocConsumer<DataBaseCubit, DataBaseStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DataBaseCubit cubit = DataBaseCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Board(),
            routes: {
              '/addtask':(context) => const AddTask(),
            },
          );
        },
      ),
    );
  }
}
