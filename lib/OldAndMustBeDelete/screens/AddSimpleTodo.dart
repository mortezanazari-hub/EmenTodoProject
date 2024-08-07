import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant.dart';
import '../MyWidget.dart';

class AddSimpleTodo extends StatefulWidget {
  const AddSimpleTodo({super.key});

  @override
  _AddSimpleTodoState createState() => _AddSimpleTodoState();
}

class _AddSimpleTodoState extends State<AddSimpleTodo> {
  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConst.back_Black_Color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                TitleWithBackIcon(
                    screenWidth: _screenWidth, title: "Create new task"),
                DateWeekSelector(
                  screenWidth: _screenWidth,
                ),
                SimpleTitle("Schedule"),
                MyCustomTextField(hint: "Name"),
                MyCustomMultiTextField(hint: "Description"),
                SizedBox(height: 25.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    MySelectTime(
                        screenWidth: _screenWidth, title: "Start Time"),
                    SizedBox(width: 10.w),
                    MySelectTime(screenWidth: _screenWidth, title: "End Time"),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 10.w),
                SimpleTitle("Priority"),
                priortyRowCheckBox(_screenWidth),
                SizedBox(height: 30.w),
                notifactionSwitch(),
                SizedBox(height: 30.w),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: double.infinity,
                      height: 50.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xffBA83DE), Color(0xffDE83B0)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Text(
                        "Custom Button",
                        style: TextStyle(fontSize: 16.w),
                      )),
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
        Text(
          "Get alert for this task",
          style: TextStyle(fontSize: 16.w),
        ),
        Spacer(),
        SizedBox(
          child: Switch(
            value: true,
            onChanged: (_checked) {},
            activeTrackColor: const Color(0xffA378FF),
            thumbColor: const WidgetStatePropertyAll(Colors.white),
            inactiveTrackColor: MyConst.field_Black_Color,
            splashRadius: 20.0.w, // Fix: set a valid double value
            //trackOutlineWidth: 2.0,
          ),
        )
      ],
    );
  }

  Row priortyRowCheckBox(double _screenWidth) {
    return Row(
      children: [
        Spacer(),
        ButtonCheckBox(
          screenWidth: _screenWidth,
          borderColor: MyConst.priorityHighColor,
          title: "High",
          onTap: (p0) => {},
        ),
        Spacer(),
        ButtonCheckBox(
          screenWidth: _screenWidth,
          borderColor: MyConst.priorityMiddleColor,
          title: "Middle",
          onTap: (p0) => {},
        ),
        Spacer(),
        ButtonCheckBox(
          screenWidth: _screenWidth,
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
        SizedBox(
          height: 50.w,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w300),
        ),
        Spacer(),
      ],
    );
  }
}

//----------------------------------------------------------
