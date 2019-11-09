import 'package:flutter/material.dart';
import 'package:reportservice/Models/Apps.dart';

class ClickableAppList extends StatelessWidget {
  final Apps app;
  final Function onTapHandler;
  ClickableAppList(this.app, this.onTapHandler);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          onTapHandler(app);
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.web),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    app.appName,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    app.appType + " ,Created " + app.dateCreated.split("T")[0],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Description:",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    app.description,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
