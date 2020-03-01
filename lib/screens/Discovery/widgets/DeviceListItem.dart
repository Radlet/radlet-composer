import 'package:flutter/material.dart';

class DeviceListItem extends StatelessWidget {
  DeviceListItem(
      {this.id, this.type, this.title, this.description, this.onAttachRequest});

  final String id;
  final String type;
  final String title;
  final String description;
  final Function(String id) onAttachRequest;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          onTap: () {
            onAttachRequest(id);
          },
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.album)],
                ),
                title: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(this.title)),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    this.description,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Icon(Icons.texture),
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
