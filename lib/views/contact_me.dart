import 'package:flutter/material.dart';
import 'package:myportfolio/styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop)
                      ? (MediaQuery.of(context).size.width / 100) * 15
                      : 16),
              child: Text(
                '''Hello there, thank you for visiting my website. I like to play around with new stuffs.
This website was built with Flutter web. As it is still unstable, you may face slow performance.

Anyway, after finishing my undergrad, I've been working as a mobile application developer mostly.
Sometimes, I work on the backend side with Express JS, MongoDB and Apollo GraphQL.

Also, I feel highly motivated when I'm working with something new. Beside works, I've a white Rabbit named Snowy, and I love my Rabbit a lot.
Sometimes I play guitar and I play Dota 2 alot. Knock me for anything, have a nice day!
                ''',
                style: TextStyle(
                  fontSize: (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop)
                      ? 20
                      : 12,
                  height: 1.5,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.mail_outline,
                color: Colors.white70,
              ),
              color: MyColors.green,
              label: Text(
                "Email Me",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop)
                      ? 16
                      : 10,
                ),
              ),
              onPressed: () {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'saifulislamadar@gmail.com',
                );
                launch(params.toString());
              },
            ),
            SizedBox(
              height: 8,
            ),
            SelectableText("saifulislamadar@gmail.com"),
          ],
        ),
      );
    });
  }
}
