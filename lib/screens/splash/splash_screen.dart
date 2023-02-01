import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../main_screens.dart';
import 'package:cherry_flash_card/database_controller.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Widget _home(){
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  "Cherry",
                  style: GoogleFonts.pacifico(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: TextButton(
                  child: Text("Continue"),
                  onPressed: () {
                    // 1
                    _completeSplash(context, MainScreens());
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Container(
            child: FutureBuilder<bool>(
              future: DatabaseController().initDataBase(),
              builder: (_, snapshot){
                if(snapshot.hasError){
                  return const Center(
                    child: Text('sqflite 오류발생'),
                  );
                }
                if(snapshot.hasData){
                  return _home();
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
      ),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
