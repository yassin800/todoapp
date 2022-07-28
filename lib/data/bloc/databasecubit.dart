import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/data/bloc/databasestate.dart';
import 'package:path/path.dart' as p;

class DataBaseCubit extends Cubit<DataBaseStates> {
  DataBaseCubit() : super(CreateDataBaseState());
  static DataBaseCubit get(context) => BlocProvider.of<DataBaseCubit>(context);

  void initiatedatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'todo.db');
    emit(InitiateDataBaseState());
    print('database initaited');
  }

  Database? database;
  List<Map> alltasks = [];
  void opendatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, deadline TEXT, startdate TEXT, enddate TEXT, reminder TEXT, repeat TEXT, status TEXT)');
    });
    emit(CreateDataBaseState());
    print('data base created');
  }

  void insertdatabase({
    required String title,
    required String deadline,
    required String startdate,
    required String enddate,
    required String reminder,
    required String repeat,
  }) async {
    await database?.transaction(
      (txn) async {
        await txn
            .rawInsert(
                'INSERT INTO Tasks (title, deadline, startdate, enddate ,reminder ,repeat)VALUES('
                '"$title","$deadline","$startdate",'
                '"$enddate","$reminder","$repeat" )')
            .then((value) {
          emit(InsertDataBaseState());
          gettasks();
        }).catchError((error) {
          print(error.toString());
        });
      },
    );
  }

  void gettasks() async {
    await database!.rawQuery('SELECT * FROM Tasks').then((value) {
      alltasks = value;
      emit(GetDataBaseElementState());
    });
  }
}
