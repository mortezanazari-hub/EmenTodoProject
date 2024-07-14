import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoproject/Constant.dart';
import 'package:todoproject/main.dart';

import '../MyWidget.dart';

class AddSimpleTodo extends StatefulWidget {
  const AddSimpleTodo({super.key});

  @override
  _AddSimpleTodoState createState() => _AddSimpleTodoState();
}

class _AddSimpleTodoState extends State<AddSimpleTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConst.back_Black_Color,
      body: Container(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleWithBackIcon(title: "Create new task"),
                DateWeekSelector(),
                SimpleTitle("Schedule"),
                MyCustomTextField(hint: "Name"),
                MyCustomMultiTextField(hint: "Description"),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    MySelectTime(title: "Start Time"),
                    const SizedBox(width: 10),
                    MySelectTime(title: "End Time"),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 10),
                SimpleTitle("Priority"),
                priortyRowCheckBox(),
                const SizedBox(height: 30),
                notifactionSwitch(),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xffBA83DE), Color(0xffDE83B0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: const Text("Custom Button")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row notifactionSwitch() {
    return Row(
      children: [
        const Text(
          "Get alert for this task",
          style: TextStyle(fontSize: 14.4),
        ),
        Spacer(),
        SizedBox(
          child: Switch(
            value: true,
            onChanged: (_checked) {},
            activeTrackColor: const Color(0xffA378FF),
            thumbColor: const WidgetStatePropertyAll(Colors.white),
            inactiveTrackColor: MyConst.field_Black_Color,
            splashRadius: 20.0, // Fix: set a valid double value
            //trackOutlineWidth: 2.0,
          ),
        )
      ],
    );
  }

  Row priortyRowCheckBox() {
    return Row(
      children: [
        Spacer(),
        ButtenCheckBox(
          borderColor: MyConst.priorityHighColor,
          title: "High",
          onTap: (p0) => {},
        ),
        Spacer(),
        ButtenCheckBox(
          borderColor: MyConst.priorityMiddleColor,
          title: "Middle",
          onTap: (p0) => {},
        ),
        Spacer(),
        ButtenCheckBox(
          borderColor: MyConst.priorityLowColor,
          title: "low",
          onTap: (p0) => {},
        ),
        Spacer()
      ],
    );
  }

  Row SimpleTitle(String title) {
    return Row(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w100),
        ),
        Spacer(),
      ],
    );
  }
}

//----------------------------------------------------------

class ButtenCheckBox extends StatefulWidget {
  String title;
  Function(bool) onTap;
  Color borderColor;

  ButtenCheckBox(
      {super.key,
      required this.title,
      required this.onTap,
      required this.borderColor});

  @override
  State<ButtenCheckBox> createState() => _ButtenCheckBoxState();
}

class _ButtenCheckBoxState extends State<ButtenCheckBox> {
  bool _checked = false; // default value is false
  late Color _borderColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _borderColor = widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _checked = !_checked;
        });
        widget.onTap(_checked);
      },
      child: Container(
          width: 120,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: _checked ? Colors.green : _borderColor,
              width: 2,
            ),
            color: _checked ? Colors.green : null,
          ),
          child: Text(widget.title)),
    );
  }
}
