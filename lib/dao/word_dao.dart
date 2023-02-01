import 'package:cherry_flash_card/database_controller.dart';
import 'package:cherry_flash_card/models/content_item.dart';
import 'package:sqflite/sqflite.dart';

class WordDao {

  //등록
  static Future<int> insert(ContentItem item) async {
    var db = DatabaseController().db;
    return await db.insert(
        ContentItemDbInfo.table,
        item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //전체조회
  static Future<List<ContentItem>> selectAll(String order) async {
    var db = DatabaseController().db;
    var query = '''
      SELECT *
      FROM ${ContentItemDbInfo.table}
      WHERE 1=1
      ORDER BY ID ${order}
    ''';

    var results = await db.rawQuery(query);
    return results.map((e) => ContentItem.fromJson(e)).toList();
  }

  //수정
  static Future<int> update(ContentItem item) async {
    var db = DatabaseController().db;
    try{
      return await db.update(ContentItemDbInfo.table, item.toMap(),
      where: '${ContentItemDbInfo.id}=?',
      whereArgs: [item.id]);
    }catch(e){
      print(e);
      return 0;
    }
  }

  //삭제
  static Future<int> delete(ContentItem item) async {
    var db = DatabaseController().db;
    return await db.delete(ContentItemDbInfo.table, where: 'id=?', whereArgs: [item.id]);
  }
}


// /*
// * 콘텐츠 등록
// */
// //Future<void> insertContent(ContentItem content) async {
// void insertContent(ContentItem content) async {
//   final db = await database;
//
//   await db.insert(
//     tableName,
//     content.toMap(content),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }
//
// /*
// * 콘텐츠목록 조회
// */
// Future<List<ContentItem>> getContents(String order) async {
//   final db = await database;
//
//   // 모든 contents를 얻기 위해 테이블에 질의합니다.
//   final List<Map<String, dynamic>> maps = await db.query('CH_CONTENTS', orderBy: "id $order");
//
//   // List<Map<String, dynamic>를 List<Content>으로 변환합니다.
//   return List.generate(maps.length, (i) {
//     return ContentItem(
//       id: maps[i]['id'],
//       word: maps[i]['word'],
//       mean: maps[i]['mean'],
//       expr: maps[i]['expr'],
//     );
//   });
// }
//
// /*
// * 콘텐츠 수정
// */
// Future<void> updateContent(ContentItem ci) async {
//   final db = await database;
//
//   // 주어진 content로 수정합니다.
//   await db.update(
//     tableName,
//     ci.toMap(ci),
//     // Content의 id가 일치하는 지 확인합니다.
//     where: "id = ?",
//     // Content의 id를 whereArg로 넘겨 SQL injection을 방지합니다.
//     whereArgs: [ci.id],
//   );
// }
//
// /*
// * 콘텐츠 삭제
// */
// Future<void> deleteContent(int id) async {
//   final db = await database;
//
//   // 데이터베이스에서 content를 삭제합니다.
//   await db.delete(
//     tableName,
//     // 특정 Content를 제거하기 위해 `where` 절을 사용하세요
//     where: "id = ?",
//     // content id를 where의 인자로 넘겨 SQL injection을 방지합니다.
//     whereArgs: [id],
//   );
// }