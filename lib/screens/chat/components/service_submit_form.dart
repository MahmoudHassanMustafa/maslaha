import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceSubmitForm extends StatefulWidget {
  const ServiceSubmitForm(this.pageController);

  final PageController pageController;

  @override
  _ServiceSubmitFormState createState() => _ServiceSubmitFormState();
}

class _ServiceSubmitFormState extends State<ServiceSubmitForm> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Service', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'e.g. Broken lamp.',
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: '120',
                hintStyle: TextStyle(fontSize: 12),
                suffixText: 'EGP.',
                suffixStyle: TextStyle(color: Colors.blue, fontSize: 12),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                const Text('Date',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                const Spacer(),
                Text(
                  _selectedDate == null
                      ? 'Choose a date!'
                      : '${DateFormat.yMd().format(_selectedDate!)}',
                  style: const TextStyle(fontSize: 14),
                ),
                IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime.now(),
                    ).then((pickedDate) {
                      if (pickedDate == null) return;
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    });
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: const Text('Start',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixText: 'H',
                      suffixStyle: TextStyle(color: Colors.blue, fontSize: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixText: 'M',
                      suffixStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
