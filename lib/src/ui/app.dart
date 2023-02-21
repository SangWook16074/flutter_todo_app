import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/ui/pages/create_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<void> _updateTodoIsDone(
    bool isDone,
    String id,
  ) async {
    await FirebaseFirestore.instance.collection('todo').doc(id).update({
      'isDone': !isDone,
    });
  }

  Future<void> _deleteTodo(String id) async {
    await FirebaseFirestore.instance.collection('todo').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter todo app'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const CreatePage())),
        icon: const Icon(Icons.add),
        label: const Text('추가'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _buildTodo(),
    );
  }

  Widget _buildTodo() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('todo')
            .orderBy('createTime', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? _loading()
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data!.docs[index];
                    var id = data.id;
                    var todo = data['todo'].toString();
                    var time = data['createTime'].toString();
                    var isDone = data['isDone'];

                    return _todoList(id, todo, time, isDone);
                  },
                );
        });
  }

  Widget _todoList(String id, String todo, String time, bool isDone) {
    return ListTile(
      title: Text(todo),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => _updateTodoIsDone(isDone, id),
            child: Icon(
              Icons.favorite,
              color: (isDone) ? Colors.grey : Colors.red,
            ),
          ),
          IconButton(
              onPressed: () => _deleteTodo(id), icon: const Icon(Icons.delete))
        ],
      ),
      onTap: () {},
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
