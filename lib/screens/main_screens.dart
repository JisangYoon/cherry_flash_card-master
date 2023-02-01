import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/nav_item.dart';
import '../screens/home/home_screen.dart';
import '../screens/drawer.dart';
import '../screens/study/study_screen.dart';
import '../screens/wrong_answer_note/wrong_answer_note_screen.dart';
import '../screens/bookmark/bookmark_screen.dart';
import '../screens/add_contents/add_contents_screen.dart';
import 'package:provider/provider.dart';
import 'package:cherry_flash_card/word_provider.dart';

class MainScreens extends StatefulWidget {
  static String routeName = "/main_screens";

  @override
  _MainScreensState createState() => _MainScreensState();

}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Cherry",style: TextStyle(color: Colors.white)),
      ),
      body: ChangeNotifierProvider(
        create: (context){
          return WordProvider();
        },
        child: IndexedStack(
          index: _selectedIndex,
          children:[
            HomeScreen(),
            StudyScreen(),
            WrongAnswerNoteScreen(),
            BookMarkScreen(),
            AddContentsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onTap: onTaped,
        items: List.generate(
          navItems.length,
              (index) => _buildBottomNavigationBarItem(
            icon: navItems[index].icon,
            label: navItems[index].label,
            isActive: navItems[index].id == _selectedIndex ? true : false,
          ),
        ),
      ),
      endDrawer: drawer(),
    );
  }


  void onTaped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildBottomNavigationBarItem(
      {String? icon,
        String? label,
        bool isActive = false,
        GestureTapCallback? press}) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 38,
        height: 38,
        child: IconButton(
          onPressed: press,
          icon: Icon(Icons.star, color: isActive? kPrimaryColor : Colors.black),
        ),
      ),
      label: label,
    );
  }
}
