import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late TextEditingController _todoController;

  Future<void> _createTodos(String todo) async {
    await FirebaseFirestore.instance.collection('todo').add({
      'todo': todo,
      'createTime': Timestamp.now(),
      'isDone': false,
    });
  }

  @override
  void initState() {
    _todoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('할일 추가하기'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildCreateTextField('할일'), _buildButton()],
        ),
      ),
    );
  }

  Widget _buildCreateTextField(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label : ',
          style: const TextStyle(fontSize: 25),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            controller: _todoController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(25)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
        onPressed: () {
          _createTodos(_todoController.text);
          Navigator.of(context).pop();
        },
        child: const Text('추가하기'));
  }
}
