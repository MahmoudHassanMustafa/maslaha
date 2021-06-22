import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/constants.dart';
import '../../utils/size_config.dart';

import '../../../widgets/profile_image_container.dart';

class ContactInfoScreen extends StatelessWidget {
  static const routeName = '/chat-contact-info';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final userName = routeArgs['username'] as String;
    final profileImg = routeArgs['profile-img'] as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kPrimaryColor),
        title: const Text(
          'Contact info',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
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
                            width: getProportionateScreenWidth(190),
                            height: getProportionateScreenWidth(190),
                            profileImg: NetworkImage(profileImg),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            userName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Proffession',
                            style: const TextStyle(color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/chat_icons/facebook.svg'),
                              SvgPicture.asset(
                                  'assets/icons/chat_icons/instagram.svg'),
                              SvgPicture.asset(
                                  'assets/icons/chat_icons/twitter.svg'),
                              // Icon(FontAwesomeIcons.facebook),
                              // Icon(FontAwesomeIcons.instagram),
                              // Icon(FontAwesomeIcons.twitter),
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
                                style: const TextStyle(color: Colors.black54),
                              ),
                              const SizedBox(width: 6),
                              const Text('No phone number was provided!'),
                            ],
                          ),
                          const Divider(
                            indent: 20,
                            endIndent: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                'E-mail:',
                                style: const TextStyle(color: Colors.black54),
                              ),
                              const SizedBox(width: 6),
                              const Text('No e-mail was provided!'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 2),
                          decoration:
                              BoxDecoration(color: Colors.grey.shade100),
                          child: Text(
                            'Media',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: Card(
                    color: index % 2 == 0 ? Colors.red : Colors.amber,
                    child: Text('Item $index'),
                  ),
                );
              },
              addRepaintBoundaries: true,
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
