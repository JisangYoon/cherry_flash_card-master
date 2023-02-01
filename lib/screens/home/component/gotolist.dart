import 'package:flutter/material.dart';
import '../../details/details_screen.dart';

class gotolist extends StatelessWidget {
  const gotolist({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, DetailScreen.routeName);
        print("click");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(title:title)),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Text(title, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
