import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutterjobtest/models/course.dart';
import 'package:flutterjobtest/models/session.dart';
import 'package:flutterjobtest/models/sessionlevel.dart';

class DataController {
  Future<Course> readCourse() async {
    final String response = await rootBundle.loadString('assets/jsondata.json');
    final data = await json.decode(response);
    return Course.fromJson(data["data"]);
  }

  Future<Sessionlevel> readSession(String sessionName) async {
    final String response = await rootBundle.loadString('assets/jsondata.json');
    final data = await json.decode(response);
    List<Session> sessions = [];

    for (var r in data["data"]["sessions"][sessionName]) {
      sessions.add(Session.fromJson(r));
    }
    return Sessionlevel(sessionName, sessions);
  }
}
