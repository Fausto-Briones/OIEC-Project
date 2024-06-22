import 'package:flutter/material.dart';

class DatePickerWithLabel extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final Color hintColor;
  final Color textColor;

  DatePickerWithLabel({
    required this.labelText,
    required this.controller,
    this.hintText = '',
    this.hintColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  _DatePickerWithLabelState createState() => _DatePickerWithLabelState();
}

class _DatePickerWithLabelState extends State<DatePickerWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          style: TextStyle(color: widget.textColor),
          controller: widget.controller,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.hintColor),
            suffixIcon: Icon(
              Icons.calendar_today,
              color: widget.hintColor,
            ),
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Colors.blue, // <-- Change this for the color of the selected date
                      onPrimary: Colors.white, // <-- Change this for the text color on the selected date
                      onSurface: Colors.black, // <-- Change this for the default text color
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue, // <-- Change this for the color of the button text
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedDate != null) {
              setState(() {
                widget.controller.text = "${pickedDate.toLocal()}".split(' ')[0];
              });
            }
          },
        ),
      ],
    );
  }
}
