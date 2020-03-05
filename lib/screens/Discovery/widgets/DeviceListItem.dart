import 'package:flutter/material.dart';

class DeviceListItem extends StatelessWidget {
  DeviceListItem(
      {this.id,
      this.type,
      this.title,
      this.description,
      this.attached,
      this.onAttachRequest,
      this.onDetachRequest});

  final String id;
  final String type;
  final String title;
  final String description;
  final bool attached;
  final Function(String id) onAttachRequest;
  final Function(String id) onDetachRequest;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          onTap: () {
            attached ? onDetachRequest(id) : onAttachRequest(id);
          },
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.album)],
                ),
                title: Padding(
                    padding: EdgeInsets.only(top: 10), child: Text(this.title)),
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
                      child: Icon(
                        Icons.texture,
                        color: attached ? Colors.green : Colors.red,
                      ),
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
