import 'package:flutter/material.dart';
import 'package:myportfolio/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroWidget extends StatefulWidget {
  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            child: Text(
              'Welcome!',
              style: TextStyle(
                  fontSize: (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop)
                      ? 60.sp
                      : 30,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        offset: Offset(-2, -2),
                        color: Colors.green,
                        blurRadius: 10)
                  ]),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(
                  0,
                  8 * animationController.value,
                ),
                child: child,
              );
            },
          ),
          SizedBox(
            height:
                (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
                    ? 32.h
                    : 16,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "Hello, my name is A. K. M. Saiful Islam",
          //     textAlign: TextAlign.center,
          //     style: MyTStyles.headline.copyWith(
          //         fontSize: (sizingInformation.deviceScreenType ==
          //                 DeviceScreenType.desktop)
          //             ? 36.sp
          //             : 12,
          //         height: 1.5),
          //   ),
          // ),
          // SizedBox(
          //   height: 32.h,
          // ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop)
                    ? 240
                    : 8,
                vertical: 8),
            child: RichText(
              text: TextSpan(
                  text: "Hello, my name is A. K. M. Saiful Islam, ",
                  style: MyTStyles.headline.copyWith(
                      fontSize: (sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop)
                          ? 36
                          : 18,
                      height: 1.1),
                  children: [
                    TextSpan(
                      text:
                          "I'm a software engineer from Bangladesh! I've been working in the professional field for more than 2 years!",
                      style: MyTStyles.subTitle.copyWith(
                          fontSize: (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop)
                              ? 20
                              : 14,
                          height: 1.1),
                    ),
                  ]),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            height: 32.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fleunt in:",
                  style: MyTStyles.subTitle.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      fontSize: (sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop)
                          ? 24
                          : 16),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Flutter/Dart, Java",
                    textAlign: TextAlign.center,
                    style: MyTStyles.subTitle.copyWith(
                        fontSize: (sizingInformation.deviceScreenType ==
                                DeviceScreenType.desktop)
                            ? 20
                            : 14,
                        height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: "Familiar with: ",
                      style: MyTStyles.subTitle.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          fontSize: (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop)
                              ? 24
                              : 16),
                      children: [
                        TextSpan(
                          text:
                              "React-native/JS, Express JS, Apollo GraphQL, iOS/Swift, Android SDK, Python",
                          style: MyTStyles.subTitle.copyWith(
                              fontSize: (sizingInformation.deviceScreenType ==
                                      DeviceScreenType.desktop)
                                  ? 20
                                  : 14,
                              height: 1.5),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
