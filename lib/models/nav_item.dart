import 'package:flutter/cupertino.dart';

class NaveItem {
  final int id;
  final String icon;
  final String label;

  NaveItem({required this.label, required this.id, required this.icon});
}

List<NaveItem> navItems = [
  NaveItem(id: 0, label: "홈", icon: "Icons.star"),
  NaveItem(id: 1, label: "학습 테스트", icon: "Icons.star"),
  NaveItem(id: 2, label: "오답노트", icon: "Icons.star"),
  NaveItem(id: 3, label: "북마크", icon: "Icons.star"),
  NaveItem(id: 4, label: "컨텐츠 등록", icon: "Icons.star"),
];
