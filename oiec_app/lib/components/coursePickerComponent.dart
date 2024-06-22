import 'package:flutter/material.dart';

class DropdownWithLabel extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final List<String> options;
  final String hintText;
  final Color hintColor;
  final Color textColor;

  DropdownWithLabel({
    required this.labelText,
    required this.controller,
    required this.options,
    this.hintText = '',
    this.hintColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  _DropdownWithLabelState createState() => _DropdownWithLabelState();
}

class _DropdownWithLabelState extends State<DropdownWithLabel> {
  String? _selectedOption;

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
              Icons.arrow_drop_down,
              color: widget.hintColor,
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ListView.builder(
                  itemCount: widget.options.length,
                  itemBuilder: (context, index) {
                    final option = widget.options[index];
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          _selectedOption = option;
                          widget.controller.text = option;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
