import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomMenuBar extends StatefulWidget {
  final ValueChanged<int> onSelected;
  final PageController pageController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomMenuBar(
      {Key key, this.onSelected, this.pageController, this.scaffoldKey})
      : super(key: key);
  @override
  _CustomMenuBarState createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
  List<String> items = ["Home", "Works", "Contact", "Resume"];
  int currentlySelected = 0;
  @override
  void initState() {
    widget.pageController.addListener(() {
      if (widget.pageController.page != currentlySelected.toDouble()) {
        setState(() {
          currentlySelected = widget.pageController.page.toInt();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            if (!widget.scaffoldKey.currentState.isEndDrawerOpen)
              widget.scaffoldKey.currentState.openEndDrawer();
          },
        );
      }
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            width:
                (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
                    ? 20
                    : 8,
          );
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 2.h),
                height: (sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop)
                    ? 60.h
                    : 30,
                padding: EdgeInsets.all(8),
                color:
                    currentlySelected == index ? Colors.black : Colors.black54,
                child: Text(
                  items[index],
                  style: TextStyle(
                    fontSize: (sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop)
                        ? 15
                        : 10,
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
                        currentlySelected = index;
                        widget.onSelected(index);
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
                        fontSize: (sizingInformation.deviceScreenType ==
                                DeviceScreenType.desktop)
                            ? 15
                            : 10,
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
      );
    });
  }
}
