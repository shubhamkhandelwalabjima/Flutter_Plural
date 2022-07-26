import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofitexample/api_service.dart';
import 'package:retrofitexample/model/task_model.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API TEST"),
      ),
      body: _listFutureTasks(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = Provider.of<ApiService>(context, listen: false);
          api.getTasks(toString()).then((it) {
            it.forEach((f) {
              print(f.title);
            });
          }).catchError((onError) {
            print(onError.toString());
          });
        },
        child: Icon(Icons.terrain),
      ),
    );
  }

  FutureBuilder _listFutureTasks(BuildContext context) {
    return FutureBuilder<List<TaskModel>>(
      future:
          Provider.of<ApiService>(context, listen: false).getTasks(toString()),
      builder: (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Something wrong"),
              ),
            );
          }
          final tasks = snapshot.data;
          return _listTasks(context: context, tasks: tasks);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  ListView _listTasks({required BuildContext context, required tasks}) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.network(tasks[index].url),
              title: Text(
                tasks[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );

  }
}
