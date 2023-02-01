import 'package:cherry_flash_card/screens/home/component/gotolist.dart';
import 'package:flutter/material.dart';
import 'package:cherry_flash_card/word_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    super.initState();
    _init();
    print('home_screen.dart:19 - initState()');
  }

  void _init() async{
    await Provider.of<WordProvider>(context, listen: false).getWordsList();
  }

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: appSize * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gotolist(title: "영단어",),
              gotolist(title: "자격증",),
              gotolist(title: "영어회화",),
            ],
          ),
        ),
      ),
    );
  }
}
