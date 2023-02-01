import 'package:provider/provider.dart';
import 'package:cherry_flash_card/word_provider.dart';
import 'package:flutter/material.dart';
import 'package:cherry_flash_card/models/content_item.dart';
import 'package:cherry_flash_card/dao/word_dao.dart';

class AddContainer extends StatefulWidget {
  const AddContainer({Key? key}) : super(key: key);

  @override
  State<AddContainer> createState() => _AddContainerState();
}

class _AddContainerState extends State<AddContainer> with SingleTickerProviderStateMixin {

  late WordProvider _wordProvider;
  final _formKey = GlobalKey<FormState>();

  //등록폼 내부 입력값을 위한 변수
  int? id;
  String word = '';
  String mean = '';
  String expr = '';

  //단어등록 컨테이너를 펼치기/접기 했을때 토글을 위한 bool
  bool _isExpanded = true;
  bool _isShow = true;

  //단어등록 컨테이너 사이즈를 받아오기 위한 변수
  double expandedSize = 0;
  double unExpandedSize = 0;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isShow = !_isShow;
    });
  }

  @override
  void initState() {
    super.initState();
    print('add_contaier.dart:43 - initState()');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    expandedSize = MediaQuery.of(context).size.height*0.4;
    unExpandedSize = MediaQuery.of(context).size.height*0.1;
  }

  @override
  Widget build(BuildContext context) {
    _wordProvider = Provider.of<WordProvider>(context, listen: false);

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      //curve: Curves.linear,
      height: _isExpanded? expandedSize:unExpandedSize,
      constraints: BoxConstraints(
        minHeight: _isExpanded ? expandedSize:unExpandedSize,
      ),
      //height: _heightAnimation.value,
      color: Colors.tealAccent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: _isShow,
              child: Container(
                margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '단어',
                            hintStyle: TextStyle(
                              //fontSize: 12,
                              //color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '단어를 입력하세요';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            word = value!;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '의미',
                            hintStyle: TextStyle(
                              //fontSize: 12,
                              //color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            mean = value!;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '예제',
                            hintStyle: TextStyle(
                              //fontSize: 12,
                              //color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            expr = value!;
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() != false) {
                                _formKey.currentState?.save();
                              }
                              var tmpContentItem = ContentItem(
                                  id: id, word: word, mean: mean, expr: expr);
                              print("*** Registing ... ***");
                              print(tmpContentItem.id);
                              print(tmpContentItem.word);
                              print(tmpContentItem.mean);
                              print(tmpContentItem.expr);
                              print("**********");
                              WordDao.insert(tmpContentItem);
                              _wordProvider.getWordsList();
                            },
                            child: const Text('[등록]')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: !_isShow,
                  child: Text('펼쳐서 등록'),
                ),
                InkWell(
                  onTap: _toggleExpand,
                  child: !_isExpanded ? Icon(Icons.expand_more):Icon(Icons.expand_less),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}