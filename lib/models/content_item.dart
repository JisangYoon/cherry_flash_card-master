class ContentItem {
  int? id;
  String word;
  String mean;
  String? expr;

  ContentItem({
    this.id,
    required this.word,
    required this.mean,
    this.expr,
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'id': id,
      'word': word,
      'mean': mean,
      'expr': expr
    };
  }

  factory ContentItem.fromJson(Map<String, dynamic> json){
    return ContentItem(
      id: json[ContentItemDbInfo.id] as int,
      word: json[ContentItemDbInfo.word] as String,
      mean: json[ContentItemDbInfo.mean] as String,
      expr: json[ContentItemDbInfo.expr] as String,
    );
  }
}

class ContentItemDbInfo {
  static String table = 'CH_CONTENTS';
  static String id = 'id';
  static String word = 'word';
  static String mean = 'mean';
  static String expr = 'expr';
}

List<ContentItem> contentItems = [
  ContentItem(id: 0, word: "home", mean: "집", expr: "this is my house"),
  ContentItem(id: 1, word: "child", mean: "아이", expr: "he is a child"),
  ContentItem(id: 2, word: "note", mean: "노트", expr: "this is a note"),
  ContentItem(id: 3, word: "book", mean: "책", expr: "this is a book"),
  ContentItem(id: 4, word: "school", mean: "학교", expr: "a school bus"),
];