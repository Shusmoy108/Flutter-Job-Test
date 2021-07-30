import 'package:flutter/material.dart';
import 'package:flutterjobtest/controllers/datacontroller.dart';
import 'package:flutterjobtest/models/course.dart';
import 'package:flutterjobtest/models/sessionlevel.dart';
import 'package:flutterjobtest/views/components/sessiontile.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  late Course course;
  List<Sessionlevel> sessions = [];
  bool load = false;
  final DataController dataController = DataController();
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    Course c = await dataController.readCourse();
    List<Sessionlevel> sessionList = [];
    for (SessionLevel s in c.sessionLevels) {
      Sessionlevel session = await dataController.readSession(s.desc);
      sessionList.add(session);
    }

    setState(() {
      course = c;
      sessions = sessionList;
      load = true;
    });
  }

  List<Widget> getsessions() {
    List<Widget> childs = [];

    for (Sessionlevel s in this.sessions) {
      childs.add(Card(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          elevation: 2,
          color: Colors.grey.shade200,
          child: Column(children: [
            Theme(
                data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    primaryColor: Colors.black,
                    accentColor: Colors.black),
                child: ExpansionTile(
                  textColor: Colors.black,
                  iconColor: Colors.black,
                  collapsedIconColor: Colors.black,
                  collapsedTextColor: Colors.black,
                  title: IntrinsicHeight(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${s.sessionName} Programs",
                      ),
                      VerticalDivider(
                        width: 1,
                        color: Colors.black,
                      )
                    ],
                  )),
                  children: [SessionTile(s)],
                )),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.orange.shade700,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add New",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700,
                          fontSize: 17),
                    )
                  ],
                ))
          ])));
      childs.add(SizedBox(
        height: 20,
      ));
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Programs"),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ))
        ],
      ),
      body: (load)
          ? Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(course.genre),
                  SizedBox(
                    height: 10,
                  ),
                  Text(course.description),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: getsessions(),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
