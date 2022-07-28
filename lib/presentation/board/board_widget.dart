import 'package:flutter/material.dart';
import 'package:todo_app/components/add_button.dart';
import 'package:todo_app/data/bloc/databasecubit.dart';
import 'package:todo_app/presentation/board/widgets/task_viewer.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomSheet: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AddButton(
              function: () {
                Navigator.pushNamed(context, '/addtask');
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Board',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 132, 130, 130),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const TabBar(
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontSize: 13),
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.all(8),
                    tabs: [
                      Tab(
                        child: Text(
                          'All',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Completed',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Uncompleted',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Favorites',
                        ),
                      ),
                    ]),
                     
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>TaskViewer(), separatorBuilder: (BuildContext context, int index) =>const Divider(), itemCount: DataBaseCubit.get(context).alltasks.length)
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}

