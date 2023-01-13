import 'package:flutter/material.dart';
import 'package:flutter_application_41/server/server.dart';
import 'package:flutter_application_41/tools/colorlor.dart';
import 'package:flutter_application_41/tools/textter.dart';
import 'package:flutter_application_41/utils/dialog.bax.dart';
import 'package:flutter_application_41/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box(AppTexts.Mybox);
  ToDoServer db = ToDoServer();

  @override
  void initState() {
    //  if it the first tome over opening the app, then creat default data
    if (_myBox.get(AppTexts.Listtodo) == null) {
      db.createInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  // text coontroller
  final _controller = TextEditingController();

  // checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  // Creat new task

  // void creatNewTask() {
  //  showDialog(context: context, builder: builder);
  // }
  // save new Task

  @override
  Widget build(BuildContext context) {
    // save new Task
    // delete task
    void deleteTask(int index) {
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDataBase();
    }

    void saveNewTask() {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }

    void creatNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBax(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      appBar: AppBar(
        title: const Text(AppTexts.name),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskame: db.toDoList[index][0],
            taskComplated: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
