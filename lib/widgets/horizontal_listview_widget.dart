import 'package:flutter/material.dart';
class HorizontalListviewWidget extends StatelessWidget {
  final Text title;
  final Text subtitle;
  final Icon? leading;
  final GestureTapCallback? onTap;
  final int quantityItems;

  HorizontalListviewWidget ({
    super.key,
    required this.title,
    required this.subtitle,
    required this.quantityItems,
    this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.quantityItems,
        itemBuilder: (context, index){
          return Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: size.width*0.40,
                height: size.height*0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                ),
                child: ListTile(
                  leading: this.leading,
                  title: this.title,
                  subtitle: this.subtitle,
                  onTap: this.onTap,
                ),
              )
          );
        }),
    );
  }
}
