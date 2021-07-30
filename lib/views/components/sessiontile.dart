import 'package:flutter/material.dart';
import 'package:flutterjobtest/models/sessionlevel.dart';

class SessionTile extends StatelessWidget {
  final Sessionlevel s;
  SessionTile(this.s);
  List<Widget> getsessionLevels() {
    List<Widget> childs = [];
    for (var i = 0; i < s.sessions.length; i++) {
      childs.add(Text(
        s.sessions[i].title,
        style: TextStyle(fontSize: 17),
      ));
      if (i != s.sessions.length - 1) childs.add(SizedBox(height: 10));
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getsessionLevels(),
      ),
    );
  }
}
