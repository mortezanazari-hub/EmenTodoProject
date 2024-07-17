//! Todo List Model
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../Constant.dart';
import '../Models/SimpleToDoModel.dart';

class TodoListModel extends StatelessWidget {
  final DateTime dateTime;
  final int index;

  const TodoListModel({Key? key, required this.dateTime, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = MyConst.TodoListQuery(dateTime)[index];

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: MyConst.field_Black_Color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PriorityIndicator(priority: todo.priority),
            const SizedBox(width: 15),
            TodoInfo(todo: todo),
            Spacer(),
            TodoCheckBox(todo: todo),
          ],
        ),
      ),
    );
  }
}

class PriorityIndicator extends StatelessWidget {
  final Priority priority;

  const PriorityIndicator({required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 80,
      color: _getPriorityColor(priority),
    );
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.high:
        return MyConst.priorityHighColor;
      case Priority.medium:
        return MyConst.priorityMiddleColor;
      case Priority.low:
        return MyConst.priorityLowColor;
      default:
        throw Exception('Unknown priority');
    }
  }
}

class TodoInfo extends StatelessWidget {
  final SimpleToDoModel todo;

  const TodoInfo({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 13),
        Text(
          todo.title,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.edit_calendar,
              color: MyConst.white_80_Color,
            ),
            const SizedBox(width: 5),
            Text(
              DateFormat('d MMM').format(todo.date),
              style: TextStyle(color: MyConst.white_80_Color, fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}

class _TodoCheckBox extends StatefulWidget {
  final SimpleToDoModel todo;

  const _TodoCheckBox({required this.todo});

  @override
  State<_TodoCheckBox> createState() => _TodoCheckBoxState();
}

class _TodoCheckBoxState extends State<_TodoCheckBox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.todo.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3,
      child: RoundCheckBox(
        isChecked: _isChecked,
        checkedColor: Color(0xffBA83DE),
        checkedWidget: Icon(Icons.check),
        border: Border.all(
          color: _isChecked ? Colors.black : Color(0xffBA83DE),
          width: 5,
          strokeAlign: 0.5,
        ),
        uncheckedColor: Color.fromARGB(0, 0, 0, 0),
        size: 26.6,
        onTap: (isChecked) {
          setState(() {
            _isChecked = isChecked!;
            widget.todo.isChecked = isChecked;
          });
        },
      ),
    );
  }
}
