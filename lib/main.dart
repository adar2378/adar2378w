import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/styles/colors.dart';
import 'package:myportfolio/views/project_screen.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'views/contact_me.dart';
import 'widgets/introduction.dart';
import 'widgets/menubar.dart';
import 'widgets/social_connect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adar\'s playground',
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: MyColors.violet),
      builder: (context, child) {
        ScreenUtil.init(context,
            width: 1920, height: 1080, allowFontScaling: true);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(), child: child);
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  List<String> items = ["Home", "Works", "Contact", "Resume"];
  int currentlySelected = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      if (pageController.page != currentlySelected.toDouble()) {
        setState(() {
          currentlySelected = pageController.page.toInt();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 8,
            );
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 2.h),
                  height: 30,
                  padding: EdgeInsets.all(8),
                  color: currentlySelected == index
                      ? Colors.black
                      : Colors.black54,
                  child: Text(
                    items[index],
                    style: TextStyle(
                      fontSize: 10,
                      color: currentlySelected == index
                          ? Colors.white
                          : Colors.white60,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 4.h,
                    left: 4.h,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (index != 3) {
                          Navigator.pop(context);
                          currentlySelected = index;
                          if (index != 3)
                            pageController.animateToPage(index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                        } else {
                          launch(
                              "https://docs.google.com/document/d/1g2eF7Shy4xRxkvzHyY7-bNO5oFgQBRPfxxkBltZ4SCE/edit?usp=sharing");
                        }
                      });
                    },
                    hoverColor: Color(0xFF4D4646).withOpacity(.7),
                    padding: EdgeInsets.all(8),
                    color: currentlySelected == index
                        ? Color(0xFF4D4646)
                        : Colors.grey,
                    child: Center(
                      child: Text(
                        items[index],
                        style: TextStyle(
                          fontSize: 10,
                          color: currentlySelected == index
                              ? Colors.white
                              : Colors.white60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    color: Color(0xFF726A95),
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IntroWidget(),
                        Positioned(
                            bottom: 36.h,
                            left: 0,
                            right: 0,
                            child: SocialConnectBar()),
                      ],
                    ),
                  ),
                  ProjectScreen(),
                  Container(
                    color: Color(0xFFA0C1B8),
                    child: ContactMeScreen(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Spacer(),
                      ResponsiveBuilder(builder: (context, sizingInformation) {
                        return SizedBox(
                          height: (sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop)
                              ? 60.h
                              : 30,
                          child: CustomMenuBar(
                            pageController: pageController,
                            scaffoldKey: scaffoldKey,
                            onSelected: (index) {
                              if (index != 3)
                                pageController.animateToPage(index,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Column(
                      children: [
                        IconButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.w, horizontal: 8.w),
                            color: Colors.black,
                            hoverColor: Colors.grey,
                            icon: Icon(
                              Icons.expand_less,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              pageController.previousPage(
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.easeIn);
                            }),
                        SizedBox(
                          height: 8,
                        ),
                        IconButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.w, horizontal: 8.w),
                            color: Colors.black,
                            hoverColor: Colors.grey,
                            icon: Icon(
                              Icons.expand_more,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.easeIn);
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
