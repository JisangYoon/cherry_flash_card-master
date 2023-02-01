import 'package:cherry_flash_card/models/content_item.dart';
import 'package:flutter/material.dart';
import 'package:cherry_flash_card/screens/add_contents/component/add_container.dart';
import 'package:cherry_flash_card/screens/add_contents/component/list_container.dart';
import 'package:provider/provider.dart';
import 'package:cherry_flash_card/word_provider.dart';
import 'package:cherry_flash_card/dao/word_dao.dart';

class AddContentsScreen extends StatelessWidget {

  Widget _listContainer(){
    return Center(
      child: Consumer<WordProvider>(
        builder: (context, data, index){
          var itemList = data.words;
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: itemList.length,
            itemBuilder: (context, index){
              return Card(
                color: Colors.deepPurpleAccent,
                child: ListTile(
                  //leading: FlutterLogo(size:56.0),
                  title: Text(itemList[index].word),
                  subtitle: Text(itemList[index].mean,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                      onPressed: () {
                        print("${itemList[index].id}_${itemList[index].word}_단어삭제");
                        data.delete(itemList[index]);
                        data.getWordsList();
                      }),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            AddContainer(),
            Expanded(
              child: SingleChildScrollView(
                  //child: ListContainer()
                child: _listContainer(),
              ),
            ),
          ],
        ),
    );
  }
}

