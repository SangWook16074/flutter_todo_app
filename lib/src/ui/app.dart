import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter todo app'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('추가'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _buildTodo(),
    );
  }

  Widget _buildTodo() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('todo').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? _loading()
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data!.docs[index];
                    var todo = data['todo'].toString();
                    var time = data['createTime'].toString();
                    var isDone = data['isDone'];

                    return _todoList(todo, time, isDone);
                  },
                );
        });
  }

  Widget _todoList(String todo, String time, bool isDone) {
    return ListTile(
      title: Text(todo),
      trailing: Icon(
        Icons.favorite,
        color: (!isDone) ? Colors.grey : Colors.red,
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
