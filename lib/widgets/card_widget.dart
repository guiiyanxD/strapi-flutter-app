import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CardWidget({super.key, required this.title, required this.icon, this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(5.0),
        shadowColor: Color(0x00000af0),
        elevation: 10.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text(title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(subtitle),
              trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(icon)),
            )
          ],
        )
    );
  }
}
