import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/model/project.dart';
import 'package:myportfolio/styles/colors.dart';
import 'package:myportfolio/styles/styles.dart';
import 'package:myportfolio/widgets/custom_expanded_tile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(accentColor: Colors.black),
      child: ButtonTheme(
        minWidth: 50,
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.green,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveBuilder(builder: (context, sizingInfo) {
                if (sizingInfo.deviceScreenType == DeviceScreenType.mobile)
                  return Container(
                    height: 20,
                  );
                return SizedBox(height: 80);
              }),
              ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  return Text(
                    "Projects",
                    style: MyTStyles.headline.copyWith(
                        fontSize: (sizingInformation.deviceScreenType ==
                                DeviceScreenType.desktop)
                            ? 32
                            : 20),
                  );
                },
              ),
              ResponsiveBuilder(builder: (context, sizingInfo) {
                if (sizingInfo.deviceScreenType == DeviceScreenType.mobile)
                  return Column(
                    children: [
                      Container(
                        height: 16,
                      ),
                      Divider()
                    ],
                  );
                return SizedBox(height: 32);
              }),
              Expanded(
                child: ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: (sizingInformation.deviceScreenType ==
                                DeviceScreenType.desktop)
                            ? (MediaQuery.of(context).size.width / 100) * 25
                            : 16,
                      ),
                      child: FutureBuilder<QuerySnapshot>(
                          future: Firestore.instance
                              .collection("projects")
                              .getDocuments(source: Source.server),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              return ListView.separated(
                                itemCount: snapshot.data.documents.length,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemBuilder: (context, index) {
                                  final data = snapshot.data.documents[index];
                                  final project = ProjectModel(
                                      appStoreLink: data["appStoreLink"] == null
                                          ? null
                                          : data["appStoreLink"],
                                      description: data["description"] == null
                                          ? ""
                                          : data["description"],
                                      iconLink: data["iconLink"] == null
                                          ? ""
                                          : data["iconLink"],
                                      name: data["name"] ?? "",
                                      playStorelink:
                                          data["playStoreLink"] ?? null,
                                      pubLink: data["pubLink"] ?? null,
                                      techUsed: data["techUsed"] ?? "",
                                      year: data["year"] ?? "");

                                  return CustomExpansionTile(
                                    title: Text(
                                      project.name + "(${project.year})",
                                      style: (sizingInformation
                                                  .deviceScreenType ==
                                              DeviceScreenType.desktop)
                                          ? TextStyle(height: 1.5, fontSize: 18)
                                          : TextStyle(
                                              fontSize: 10, height: 1.5),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(project.techUsed,
                                            style: (sizingInformation
                                                        .deviceScreenType ==
                                                    DeviceScreenType.desktop)
                                                ? TextStyle(
                                                    height: 1.5,
                                                  )
                                                : TextStyle(
                                                    fontSize: 10, height: 1.5)),
                                        Wrap(
                                          children: [
                                            FlatButton(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              padding: EdgeInsets.zero,
                                              onPressed: project.appStoreLink ==
                                                      null
                                                  ? null
                                                  : () {
                                                      launch(
                                                          project.appStoreLink);
                                                    },
                                              child: Text("AppStore",
                                                  style: (sizingInformation
                                                              .deviceScreenType ==
                                                          DeviceScreenType
                                                              .desktop)
                                                      ? TextStyle(height: 1.5)
                                                      : TextStyle(
                                                          fontSize: 10,
                                                          height: 1.5)),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            FlatButton(
                                              padding: EdgeInsets.zero,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              onPressed:
                                                  project.playStorelink ==
                                                              null ||
                                                          project.playStorelink
                                                              .isEmpty
                                                      ? null
                                                      : () {
                                                          launch(project
                                                              .playStorelink);
                                                        },
                                              child: Text("Playstore",
                                                  style: (sizingInformation
                                                              .deviceScreenType ==
                                                          DeviceScreenType
                                                              .desktop)
                                                      ? TextStyle(height: 1.5)
                                                      : TextStyle(
                                                          fontSize: 10,
                                                          height: 1.5)),
                                            ),
                                            if (project.pubLink != null &&
                                                project.pubLink.isEmpty)
                                              SizedBox(
                                                width: 8,
                                              ),
                                            if (project.pubLink != null)
                                              FlatButton(
                                                padding: EdgeInsets.zero,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                onPressed: project.pubLink ==
                                                        null
                                                    ? null
                                                    : () {
                                                        launch(project.pubLink);
                                                      },
                                                child: Text("Pub.dev",
                                                    style: (sizingInformation
                                                                .deviceScreenType ==
                                                            DeviceScreenType
                                                                .desktop)
                                                        ? TextStyle(height: 1.5)
                                                        : TextStyle(
                                                            fontSize: 10,
                                                            height: 1.5)),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    leading: Container(
                                      // color: Colors.grey.shade300,
                                      child: Image.network(
                                        project.iconLink,
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          project.description,
                                          style: (sizingInformation
                                                      .deviceScreenType ==
                                                  DeviceScreenType.desktop)
                                              ? TextStyle(
                                                  height: 1.5,
                                                  color: Colors.white)
                                              : TextStyle(
                                                  fontSize: 10,
                                                  height: 1.5,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.blue),
                                    ),
                                  ),
                                ],
                              );
                          }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
