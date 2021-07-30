import 'package:flutter/material.dart';
import 'package:flutterjobtest/models/session.dart';
import 'package:flutterjobtest/models/sessionlevel.dart';

class SessionTile extends StatefulWidget {
  final Sessionlevel s;

  SessionTile(this.s);
  @override
  State<StatefulWidget> createState() {
    return SessionTileState(s);
  }
}

class SessionTileState extends State<SessionTile> {
  Sessionlevel s;

  SessionTileState(this.s);
  List<Widget> getsessionLevels() {
    List<Widget> childs = [];
    for (var i = 0; i < s.sessions.length; i++) {
      childs.add(Text(
        s.sessions[i].title,
        style: TextStyle(fontSize: 17),
      ));
      if (i != s.sessions.length - 1)
        childs.add(Divider(
          thickness: 1,
        ));
    }
    return childs;
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget.s.sessions.removeAt(oldindex);
      widget.s.sessions.insert(newindex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      color: Colors.white,
      //height: 100,
      child: ReorderableListView(
        shrinkWrap: true,
        children: <Widget>[
          for (final Session items in widget.s.sessions)
            ListTile(
              key: ValueKey(items),
              title: Text(items.title),
            ),
        ],
        onReorder: reorderData,
      ),
    );
  }
}
