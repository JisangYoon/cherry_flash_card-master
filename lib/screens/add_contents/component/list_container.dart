import 'package:provider/provider.dart';
import 'package:cherry_flash_card/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:cherry_flash_card/models/content_item.dart';

class ListContainer extends StatefulWidget {
  const ListContainer({Key? key}) : super(key: key);

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  late WordProvider _wordProvider;
  //final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  //List<ContentItem> contents2 = [];
  //DBHelper dbHelper = DBHelper();

  /*
  * 등록된 컨텐츠목록을 DB에서 가져와서 List<ContentItem> 형식으로 리턴한다
   */
  //List<ContentItem> getItems(){
//    List<ContentItem> c = [];
//    print('*** db에서 데이터 불러오는중 (getItems()) ***');
//    dbHelper.getContents("DESC").then((value) => value.forEach((element) {
//      print('_id: ${element.id}, _word: ${element.word}');
//      c.add(element);
//    }));

//    return c;
//  }

  void refresh(){
    print('refresh...');
  }

  /*
  * 리스트가 Refresh 될때 다시 데이터를 조회해온다
   */
  Future _onRefresh() async {
    print('called onRefresh!!!');
//    contents2.clear();
//    setState(() {
//      contents2 = getItems();
//    });

    // _refreshIndicatorKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0));
  }

  /*
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _wordProvider = Provider.of<WordProvider>(context);
  }*/

//  @override
//  void initState(){
//    print('called initState');
//    super.initState();
//    //contents.clear();
//    contents2 = getItems();

//    // //등록된 컨텐츠목록을 DB에서 가져온다
//    // dbHelper.getContents().then((value) => value.forEach((element) {
//    //   print('_id: ${element.id}, _word: ${element.word}');
//    //   contents.add(element);
//    // }));
//  }

  @override
  Widget build(BuildContext context) {
    _wordProvider = Provider.of<WordProvider>(context, listen: false);
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
                  leading: FlutterLogo(size:56.0),
                  title: Text(itemList[index].word),
                  subtitle: Text(itemList[index].mean,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                  trailing: Icon(Icons.more_vert),
                ),
              );
            },
          );
        },
      ),
    );
  }
}