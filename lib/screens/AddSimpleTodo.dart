import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoproject/Constant.dart';

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
                DateWeekSelector()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateWeekSelector extends StatefulWidget {
  const DateWeekSelector({super.key});

  @override
  State<DateWeekSelector> createState() => _DateWeekSelectorState();
}

class _DateWeekSelectorState extends State<DateWeekSelector> {
  late DateTime _selectedDate;
  late List<DateTime> _sevenDays;
  DateTime? selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _sevenDays = List.generate(7, (index) => _selectedDate.add(Duration(days: index)));
    selectedDay = _sevenDays[3];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                    color: MyConst.purpleColor,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "${MyConst.formatDate(_selectedDate)} - ${MyConst.formatDate(_selectedDate.add(Duration(days: 6)))}",
                style: TextStyle(color: MyConst.purpleColor, fontSize: 20),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: MyConst.purpleColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            clipBehavior: Clip.none,
            width: double.infinity,
            height: 75,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var currentDay = _sevenDays[index];
                var isSelected = currentDay == selectedDay;

                return InkWell(

                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    setState(() {
                      selectedDay = currentDay;
                    });
                  },
                  child: AnimatedContainer(
                    clipBehavior: Clip.none,
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: isSelected
                          ? Border.all(color: MyConst.purpleColor, width: 2)
                          : null,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('EEE').format(currentDay),
                                style: TextStyle(
                                  color: isSelected ? MyConst.purpleColor : Colors.white60,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                DateFormat('dd').format(currentDay),
                                style: TextStyle(
                                  color: isSelected ? MyConst.purpleColor : Colors.white60,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            top: 57,
                            child: Icon(
                              Icons.circle,
                              color: MyConst.purpleColor,
                              size: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
//!Title With Back Icon
class TitleWithBackIcon extends StatelessWidget {
  String title;

  TitleWithBackIcon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //
      height: 100,
      child: Row(
        children: [
          Container(
              width: 30,
              height: 30,
              child: IconButton(
                style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side:
                            const BorderSide(color: Colors.white, width: 1.5)),
                    padding: EdgeInsets.all(3)),
                icon: Icon(
                  size: 16,
                  Icons.arrow_back,
                  color: MyConst.white_Color,
                ),
                onPressed: () {},
              )),
          Spacer(),
          Text(
            title,
            style: TextStyle(fontSize: 25),
          ),
          Spacer(),
          SizedBox(height: 30, width: 30)
        ],
      ),
    );
  }
}
