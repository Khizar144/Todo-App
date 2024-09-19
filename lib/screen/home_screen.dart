import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providors/task_provider.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/task_tile.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('To Do'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: taskProvider.fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
           // return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return TaskTile(
                taskName: task['title'],
                isCompleted: task['isCompleted'] == 1,
                onPressed: (value) {
                  taskProvider.updateTaskCompletion(task['id'], value ?? false);
                },
                OnDelete: () {
                  taskProvider.deleteTask(task['id']);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show DialogBox to add a new task
          showDialog(
            context: context,
            builder: (context) => DialogBox(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
