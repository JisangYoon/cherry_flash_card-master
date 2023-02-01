import 'package:flutter/cupertino.dart';
import 'package:cherry_flash_card/models/content_item.dart';
import 'package:cherry_flash_card/dao/word_dao.dart';

class WordProvider extends ChangeNotifier {
  List<ContentItem> _words = [];
  List<ContentItem> get words => _words;

  int get len => _words.length;

  Future<void> getWordsList() async {
    _words.clear();
    var w_list = await WordDao.selectAll("DESC");
    _words.addAll(w_list);
    notifyListeners();
  }

  Future<void> delete(ContentItem item) async {
    await WordDao.delete(item);
    notifyListeners();
  }

}