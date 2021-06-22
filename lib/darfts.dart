// RatingBar.builder(
//    initialRating: 3,
//    minRating: 1,
//    direction: Axis.horizontal,
//    allowHalfRating: true,
//    itemCount: 5,
//    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//    itemBuilder: (context, _) => Icon(
//      Icons.star,
//      color: Colors.amber,
//    ),
//    onRatingUpdate: (rating) {
//      print(rating);
//    },
// );

// Future<Null> _selectTime(BuildContext context) async {
//   final TimeOfDay picked = await showTimePicker(
//     context: context,
//     initialTime: selectedTime,
//   );
//   if (picked != null)
//     setState(() {
//       selectedTime = picked;
//       _hour = selectedTime.hour.toString();
//       _minute = selectedTime.minute.toString();
//       _time = _hour + ' : ' + _minute;
//       _timeController.text = _time;
//       _timeController.text = formatDate(
//           DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
//           [hh, ':', nn, " ", am]).toString();
//     });}
