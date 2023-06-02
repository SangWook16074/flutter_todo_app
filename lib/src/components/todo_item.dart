import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/data/model/todo_model.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final void Function(bool?) onPressed;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 0,
                blurRadius: 7,
                offset: const Offset(0, 5))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      'assets/images/lead_icon.png',
                      fit: BoxFit.cover,
                    )),
              ),
              Text(
                todo.todo,
                style: TextStyle(
                    fontSize: 20,
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          Row(
            children: [Checkbox(value: todo.isDone, onChanged: onPressed)],
          )
        ],
      ),
    );
  }
}
