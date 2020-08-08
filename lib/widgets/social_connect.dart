import 'package:flutter/material.dart';
import 'package:myportfolio/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialConnectBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FlatButton.icon(
          icon: Image.asset(
            "images/github.webp",
            height: 24,
            width: 24,
          ),
          label: Text(
            "GitHub",
            style: MyTStyles.socialButton,
          ),
          onPressed: () {
            launch("https://github.com/adar2378");
          },
        ),
        FlatButton.icon(
          icon: Image.asset(
            "images/linkedin.webp",
            height: 24,
            width: 24,
          ),
          label: Text(
            "Linkedin",
            style: MyTStyles.socialButton,
          ),
          onPressed: () {
            launch("https://www.linkedin.com/in/saiful-islam-adar/");
          },
        ),
        FlatButton.icon(
          icon: Image.asset(
            "images/stackoverflow.png",
            height: 24,
            width: 24,
          ),
          label: Text(
            "Stackoverflow",
            style: MyTStyles.socialButton,
          ),
          onPressed: () {
            print("pressed");
            launch("https://stackoverflow.com/users/4158349/saiful-islam-adar");
          },
        ),
        FlatButton.icon(
          icon: Image.asset(
            "images/youtube.webp",
            height: 24,
            width: 24,
          ),
          label: Text(
            "Youtube",
            style: MyTStyles.socialButton,
          ),
          onPressed: () {
            launch(
                "https://www.youtube.com/watch?v=p97wuh1J6Fc&list=PLSzAduAyNr2VcGPTWgZ2xkQt18EQOFb-f");
          },
        ),
      ],
    );
  }
}
