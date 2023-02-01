import 'package:flutter/material.dart';
import '../../models/content_item.dart';


class DetailScreen extends StatefulWidget {
  static String routeName = "/details";
  const DetailScreen({super.key, required this.title});

// 전달받은  title을 화면 내에서 사용함
  final String title;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Cherry", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Text(widget.title),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: contentItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(
                        child: Text(' ${contentItems[index].word} 의 뜻은 \'${contentItems[index].mean}\'')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
