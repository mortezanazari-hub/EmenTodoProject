import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todoproject/Constant.dart';
import 'package:todoproject/Models/SimpleToDoModel.dart';

//!Select Time widget
class MySelectTime extends StatefulWidget {
  final String title;
  double screenWidth;

  MySelectTime({super.key, required this.title, required this.screenWidth});

  @override
  State<MySelectTime> createState() => _MySelectTimeState();
}

class _MySelectTimeState extends State<MySelectTime> {
  late TimeOfDay _timeOfDay;
  late double _screenWidth;
  @override
  void initState() {
    super.initState();
    _timeOfDay = TimeOfDay(hour: 0, minute: 0);
    _screenWidth = widget.screenWidth;
  }

  String formatTimeOfDay(TimeOfDay time) {
    final hours = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minutes = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return "$hours : $minutes $period";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20.w,
              fontWeight: FontWeight.w300),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(14.r),
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: _timeOfDay,
              confirmText: "Ok",
              cancelText: "Cancel",
            );
            if (pickedTime != null && pickedTime != _timeOfDay) {
              setState(() {
                _timeOfDay = pickedTime;
              });
            }
          },
          child: Container(
            height: 58.w,
            width: _screenWidth / 2.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: MyConst.field_Black_Color),
            padding: EdgeInsets.only(
                left: _screenWidth / 60,
                top: _screenWidth / 58,
                bottom: _screenWidth / 58,
                right: _screenWidth / 58),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 25.w,
                  color: MyConst.purpleColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  formatTimeOfDay(_timeOfDay),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 18.w),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

//!To do List Model
class TodoListModel extends StatelessWidget {
  late DateTime dateTime;
  late int index;

  TodoListModel({super.key, required this.index, required this.dateTime});

  Random random = new Random();

  late var _todoList = MyConst.TodoListQuery(dateTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: MyConst.field_Black_Color),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 15,
              height: 80,
              color: _todoList[index].priority == Priority.high
                  ? MyConst.priorityHighColor
                  : _todoList[index].priority == Priority.medium
                      ? MyConst.priorityMiddleColor
                      : MyConst.priorityLowColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13),
                Text(
                  _todoList[index].title,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.edit_calendar,
                      color: MyConst.white_80_Color,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      DateFormat('d MMM').format(_todoList[index].date),
                      style: TextStyle(
                          color: MyConst.white_80_Color, fontSize: 14),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Center(
              heightFactor: 3,
              child: RoundCheckBox(
                isChecked: _todoList[index].isChecked,
                checkedColor: Color(0xffBA83DE),
                checkedWidget: Icon(Icons.check),
                border: Border.all(
                  color: _todoList[index].isChecked
                      ? Colors.black
                      : Color(0xffBA83DE),
                  width: 5,
                  strokeAlign: 0.5,
                ),
                uncheckedColor: Color.fromARGB(0, 0, 0, 0),
                size: 26.6,
                onTap: (istap) {
                  _todoList[index].isChecked = !_todoList[index].isChecked;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//!Daily Task
class DailyTask extends StatelessWidget {
  const DailyTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int totalTask = 3;
    int compeleteTask = 2;
    String progressComplete = "$compeleteTask/$totalTask";

    double progressPresent = (compeleteTask / totalTask) * 100;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          color: MyConst.field_Black_Color,
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Daily Task",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                progressComplete,
                style: TextStyle(
                  color: MyConst.white_80_Color,
                  fontSize: 16,
                ),
              ),
              Text(
                "  Task Complete",
                style: TextStyle(
                    color: MyConst.white_80_Color,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "You are almost done go ahead",
                style: TextStyle(
                    color: MyConst.white_80_Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w100),
              ),
              const Spacer(),
              Text(
                "${progressPresent.toStringAsFixed(0)}%",
                style: TextStyle(
                    color: MyConst.white_80_Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w100),
              )
            ],
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                backgroundBlendMode: BlendMode.multiply,
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: LinearProgressIndicator(
              minHeight: 18,
              value: progressPresent / 100,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: const Color.fromARGB(100, 186, 131, 222),
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(240, 186, 131, 222)),
            ),
          )
        ],
      ),
    );
  }
}

//!Title with seeAll link
class TitleWithLink extends StatelessWidget {
  late String title;
  late void Function() onPressed;

  TitleWithLink({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          TextButton(
              onPressed: onPressed,
              child: const Text(
                "SeeAll",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}

//!SearchBar
class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
          color: MyConst.field_Black_Color,
          borderRadius: BorderRadius.circular(7)),
      child: TextField(
        style: TextStyle(color: MyConst.white_Color),
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: "Search Task Here",
            prefixIcon: Icon(
              Icons.search,
              opticalSize: 100,
              color: MyConst.white_80_Color,
            ),
            fillColor: MyConst.white_80_Color,
            hintStyle: TextStyle(color: MyConst.white_Color)),
      ),
    );
  }
}

//!Title With Avatar widget
class TitleWithAvatar extends StatelessWidget {
  const TitleWithAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 24),
            children: const [
              TextSpan(
                  text: 'You have got 5 tasks\ntoday to complete ',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Image(
                  image: AssetImage("assets/images/pencil.png"),
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              foregroundImage: AssetImage("assets/images/avatar.png"),
              child: Text('Profile Picture'),
            ),
            Positioned(
              top: 50,
              left: 40,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: const Color(0xffFF763B),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//! one line text field
class MyCustomTextField extends StatelessWidget {
  String hint;

  MyCustomTextField({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.w),
      padding: EdgeInsets.only(top: 6.w),
      height: 60.w,
      decoration: BoxDecoration(
          color: MyConst.field_Black_Color,
          borderRadius: BorderRadius.circular(7.w)),
      child: TextField(
        style: TextStyle(color: MyConst.white_Color, fontSize: 16.w),
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: hint,
            fillColor: MyConst.white_80_Color,
            hintStyle:
                TextStyle(color: MyConst.white_80_Color, fontSize: 16.w)),
      ),
    );
  }
}

//! multi line text field
class MyCustomMultiTextField extends StatelessWidget {
  String hint;

  MyCustomMultiTextField({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.w),
      padding: EdgeInsets.only(top: 6.w),
      decoration: BoxDecoration(
          color: MyConst.field_Black_Color,
          borderRadius: BorderRadius.circular(7.w)),
      child: TextField(
        maxLines: null,
        minLines: 3,
        maxLength: 500,
        style: TextStyle(color: MyConst.white_Color, fontSize: 16.w),
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: hint,
            hintStyle:
                TextStyle(color: MyConst.white_80_Color, fontSize: 16.w)),
      ),
    );
  }
}

//! DateWeekSelector
class DateWeekSelector extends StatefulWidget {
  double screenWidth;

  DateWeekSelector({super.key, required this.screenWidth});

  @override
  State<DateWeekSelector> createState() => _DateWeekSelectorState();
}

class _DateWeekSelectorState extends State<DateWeekSelector> {
  late double _screenWidth;
  late DateTime _selectedDate;
  late List<DateTime> _sevenDays;
  DateTime? selectedDay;

  @override
  void initState() {
    super.initState();
    _screenWidth = widget.screenWidth;
    _selectedDate = DateTime.now();
    _sevenDays =
        List.generate(7, (index) => _selectedDate.add(Duration(days: index)));
    selectedDay = _sevenDays[3];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ShowWeek(),
          SizedBox(height: 20.w),
          SelectOfWeek(),
        ],
      ),
    );
  }

//* Show Week duration
  Row ShowWeek() {
    DateTime? selected;
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              var _changedTime = _selectedDate.add(Duration(days: -7));
              _selectedDate = _changedTime;
              _sevenDays = List.generate(
                  7, (index) => _selectedDate.add(Duration(days: index)));
            });
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.keyboard_arrow_left,
              size: 25.w,
              color: MyConst.purpleColor,
            ),
          ),
        ), // <
        const Spacer(),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate!,
              firstDate: DateTime(2020),
              lastDate: DateTime.now().add(Duration(days: 3650)),
            );
            if (pickedDate != null && pickedDate != _selectedDate) {
              setState(() {
                _selectedDate = pickedDate;
                _sevenDays = List.generate(
                    7, (index) => _selectedDate.add(Duration(days: index)));
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "${MyConst.formatDate(_selectedDate)} - ${MyConst.formatDate(_selectedDate.add(Duration(days: 6)))}",
              style: TextStyle(color: MyConst.purpleColor, fontSize: 16.w),
            ),
          ),
        ), // date picker
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              var _changedTime = _selectedDate.add(Duration(days: 7));
              _selectedDate = _changedTime;
              _sevenDays = List.generate(
                  7, (index) => _selectedDate.add(Duration(days: index)));
            });
          },
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 25.w,
              color: MyConst.purpleColor,
            ),
          ),
        ), // >
      ],
    );
  }

  //! select a day from week
  Container SelectOfWeek() {
    return Container(
      clipBehavior: Clip.none,
      width: double.infinity,
      height: 75.sp,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var currentDay = _sevenDays[index];
            var isSelected = currentDay == selectedDay;

            return InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                print("$_screenWidth => ${_screenWidth / 11}");
                setState(() {
                  selectedDay = currentDay;
                });
              },
              child: AnimatedContainer(
                clipBehavior: Clip.none,
                duration: const Duration(milliseconds: 50),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: isSelected
                      ? Border.all(color: MyConst.purpleColor, width: 2)
                      : null,
                ),
                padding: EdgeInsets.only(
                    top: 8, bottom: 8, right: 10.5.w, left: 10.5.w),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: _screenWidth / 13,
                      height: 100.sp,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EEE').format(currentDay),
                            style: TextStyle(
                              color: isSelected
                                  ? MyConst.purpleColor
                                  : Colors.white60,
                              fontSize: 14.w,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            DateFormat('dd').format(currentDay),
                            style: TextStyle(
                              color: isSelected
                                  ? MyConst.purpleColor
                                  : Colors.white60,
                              fontSize: 14.w,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Positioned(
                        //top: 58.dm,
                        bottom: -14.r,
                        child: Icon(
                          Icons.circle,
                          color: MyConst.purpleColor,
                          size: 11.sp,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//!Title With Back Icon
class TitleWithBackIcon extends StatelessWidget {
  String title;
  double screenWidth;

  TitleWithBackIcon(
      {super.key, required this.title, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //
      height: 70.w,
      child: Row(
        children: [
          Container(
              width: 30.w,
              height: 30.w,
              child: IconButton(
                style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.w),
                        side:
                            const BorderSide(color: Colors.white, width: 1.5)),
                    padding: EdgeInsets.all(3.w)),
                icon: Icon(
                  size: 16.w,
                  Icons.arrow_back,
                  color: MyConst.white_Color,
                ),
                onPressed: () {},
              )),
          Spacer(),
          Text(
            title,
            style: TextStyle(fontSize: 24.w),
          ),
          Spacer(),
          SizedBox(height: 30.w, width: 30.w)
        ],
      ),
    );
  }
}
