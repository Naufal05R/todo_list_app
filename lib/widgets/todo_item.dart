import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants/colors.dart';
import 'package:flutter_application_3/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onTodoChanged;
  final onDeleteItem;
  final index;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteItem,
    this.index,
  }) : super(key: key);

  Color getTileColorFromIndex(int colorNumber) {
    Color colorName = Colors.white;
    switch (colorNumber) {
      case 0:
        colorName = Colors.pink.shade100;
        break;
      case 1:
        colorName = Colors.orange.shade100;
        break;
      case 2:
        colorName = Colors.green.shade100;
        break;
      case 3:
        colorName = Colors.blue.shade100;
        break;
      case 4:
        colorName = Colors.indigo.shade100;
        break;
      case 5:
        colorName = Colors.purple.shade100;
        break;
      default:
        colorName = Colors.white;
        break;
    }
    return colorName;
  }

  Color getLeadingeColorFromIndex(int colorNumber) {
    Color colorName = Colors.white;
    switch (colorNumber) {
      case 0:
        colorName = Colors.pink.shade400;
        break;
      case 1:
        colorName = Colors.orange.shade400;
        break;
      case 2:
        colorName = Colors.green.shade400;
        break;
      case 3:
        colorName = Colors.blue.shade400;
        break;
      case 4:
        colorName = Colors.indigo.shade400;
        break;
      case 5:
        colorName = Colors.purple.shade400;
        break;
      default:
        colorName = Colors.white;
        break;
    }
    return colorName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onTodoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.only(left: 20, right: 15, top: 5, bottom: 5),
          tileColor: getTileColorFromIndex(index % 6),
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: getLeadingeColorFromIndex(index % 6),
          ),
          title: Text(todo.todoText!,
              style: TextStyle(
                  fontSize: 16,
                  color: tdBlack,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null)),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: tdRed, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: const Icon(Icons.delete),
              onPressed: () {
                // print('Clicked on Delete Button.');
                onDeleteItem(todo.id);
              },
            ),
          ),
        ));
  }
}
