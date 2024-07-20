import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../Constant.dart';
import '../Models/SimpleToDoModel.dart';

class TodoListModel extends StatefulWidget {
  final DateTime dateTime;

  TodoListModel({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  @override
  State<TodoListModel> createState() => _TodoListModelState();
}

class _TodoListModelState extends State<TodoListModel> {
  int? _longPressedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        final todo = MyConst.TodoListQuery(widget.dateTime)[index];

        return Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: MyConst.field_Black_Color,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                InkWell(
                  onLongPress: () {
                    setState(() {
                      _longPressedIndex = index;
                    });
                  },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PriorityIndicator(priority: todo.priority),
                        const SizedBox(width: 15),
                        TodoInfo(todo: todo),
                        const Spacer(),
                        _TodoCheckBox(todo: todo),
                      ],
                    ),
                  ),
                ),
                if (_longPressedIndex == index)
                  Positioned.fill(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black54.withOpacity(0.9),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              _longPressedIndex = null;
                              // Add your delete logic here
                            });
                          },
                        ),
                      ),
                    ),
                  )
                else
                  SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void didUpdateWidget(TodoListModel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_longPressedIndex != null && _longPressedIndex! >= 3) {
      _longPressedIndex = null;
    }
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
