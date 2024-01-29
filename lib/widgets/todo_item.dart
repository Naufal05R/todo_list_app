import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants/colors.dart';
import 'package:flutter_application_3/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onTodoChanged;
  final onDeleteItem;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  String getColorName(int colorNumber) {
    String colorName = "";
    switch (colorNumber) {
      case 1:
        colorName = "Red";
        break;
      case 2:
        colorName = "Orange";
        break;
      case 3:
        colorName = "Yellow";
        break;
      case 4:
        colorName = "Green";
        break;
      case 5:
        colorName = "Blue";
        break;
      case 6:
        colorName = "Indigo";
        break;
      case 7:
        colorName = "Violet";
        break;
      default:
        colorName = "White";
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
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
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
