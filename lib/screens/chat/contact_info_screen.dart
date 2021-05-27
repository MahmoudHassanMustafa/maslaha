import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './components/profile_image_container.dart';

class ContactInfoScreen extends StatelessWidget {
  static const routeName = '/chat-contact-info';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Contact info',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              child: Column(
                children: [
                  ProfileImageContainer(
                      width: 180,
                      height: 180,
                      imageUrl:
                          'https://scontent.fcai19-3.fna.fbcdn.net/v/t1.6435-9/100591939_128604252147350_6201287482357579776_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=QrT9r_WuWi4AX_ptxO7&_nc_ht=scontent.fcai19-3.fna&oh=cbd727b414f0359f63546e9217e009da&oe=60C5434B'),
                  SizedBox(height: 10),
                  Text(
                    'User name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Proffession',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      Icon(FontAwesomeIcons.instagram),
                      Icon(FontAwesomeIcons.twitter),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Phone number:',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(width: 6),
                      Text('No phone number was provided!'),
                    ],
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'E-mail:',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(width: 6),
                      Text('No e-mail was provided!'),
                    ],
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
