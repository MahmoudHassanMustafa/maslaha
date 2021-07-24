import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:maslaha/shared/constants.dart';
import 'package:maslaha/utils/size_config.dart';

class ServiceSubmitForm extends StatefulWidget {
  @override
  _ServiceSubmitFormState createState() => _ServiceSubmitFormState();
}

class _ServiceSubmitFormState extends State<ServiceSubmitForm> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Center(
              child: const Text(
                'Pose your service',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildFieldTitle('Info'),
                TextField(
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.help),
                    labelText: 'Service desc.',
                    hintText: 'What you gonna do?',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.attach_money_rounded),
                    labelText: 'Price',
                    hintText: '120 EGP.',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                buildFieldTitle('Date & Time'),
                TextField(
                  onTap: () {
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
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today_rounded),
                    hintText: _selectedDate == null
                        ? 'Choose the agreed upon date'
                        : '${DateFormat.yMd().format(_selectedDate!)}',
                    hintStyle: TextStyle(
                        color: _selectedDate == null
                            ? Colors.black54
                            : kPrimaryColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((pickedTime) {
                      if (pickedTime == null) return;
                      setState(() {
                        _selectedStartTime = pickedTime;
                      });
                      print(pickedTime.format(context));
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.timelapse_rounded),
                    hintText: _selectedStartTime != null
                        ? _selectedStartTime?.format(context)
                        : 'Start time.',
                    hintStyle: TextStyle(
                        color: _selectedStartTime != null
                            ? kPrimaryColor
                            : Colors.black54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((pickedTime) {
                      if (pickedTime == null) return;
                      setState(() {
                        _selectedEndTime = pickedTime;
                      });
                      print(pickedTime.format(context));
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.timelapse_rounded),
                    hintText: _selectedEndTime != null
                        ? _selectedEndTime?.format(context)
                        : 'Expected end time.',
                    hintStyle: TextStyle(
                        color: _selectedEndTime != null
                            ? kPrimaryColor
                            : Colors.black54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    buildFieldTitle('Notes'),
                    SizedBox(width: 4),
                    Text(
                      '(Optional)',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText:
                        'Notes as a reference for later use.\nNot seen by your client.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () {},
              child: Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
