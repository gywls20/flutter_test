import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( //타이틀 색깔
        primarySwatch: Colors.cyan
      ),
      home: MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget{

  @override
  State<MaterialFlutterApp> createState() {
    return _MaterialFlutterApp();
  }

}



class _MaterialFlutterApp extends State<MaterialFlutterApp>{

  var _imgIndex = 0;
  var imgList = ["han.JPG", "pochaco.jpg", "purin.jpg"];
  String  url = "";
  List _btnList = ['han.JPG', 'pochaco.jpg', 'purin.jpg'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = List.empty(growable: true);
  String? _buttonText;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle'),),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('화이팅!'),
              Icon(Icons.accessible_forward),
              Image.asset("image/${_btnList[_imgIndex]}"),
              ElevatedButton(onPressed: _click, child: const Text('클릭하면 이미지 바뀜')),
              DropdownButton(items: _dropDownMenuItems , onChanged: (String? value){
                setState(() {
                  if(value=='han.JPG'){
                    _imgIndex=0;
                  }else if(value=='pochaco.jpg'){
                    _imgIndex=1;
                  }else{
                    _imgIndex=2;
                  }
                });
              }, value: _buttonText),
            ],
          )
        ),
      ),
    );
  }
  void _click(){
    setState( (){
      if (_imgIndex == imgList.length - 1) {
        _imgIndex = 0;
      } else {
        _imgIndex = _imgIndex + 1 % imgList.length;
      }
    });
  }
  @override
  void initState(){
    super.initState();
    for(var item in _btnList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

}












class _WidgetExampleState extends State<MaterialFlutterApp> {

  void _generateRandomNumbers() {
    setState(() {
      value3 = Random().nextInt(100);
      value4 = Random().nextInt(100);
      value1.text = value3.toString();
      value2.text = value4.toString();
    });
  }

  int value3 = 0, value4 = 0;
  String sum='';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  final List _btnList = ['ADD', 'SUB', 'MUL', 'DIV'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = List.empty(growable: true);
  String? _buttonText;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Example'),
        centerTitle: false,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child:Text("result = $sum")
          ),

          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:TextField(keyboardType: TextInputType.number, controller: value1)
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:TextField(keyboardType: TextInputType.number, controller: value2)
          ),
          Padding(
              padding: EdgeInsets.all(15),
              child:ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber))
                ,onPressed: () {
                setState(() {
                  var value1Int =double.parse(value3.toString());
                  var value2Int =double.parse(value4.toString());

                  double result;

                  if (_buttonText == 'ADD'){
                    result = value1Int + value2Int;
                  }else if(_buttonText == 'SUB'){
                    result = value1Int - value2Int;
                  }else if(_buttonText == 'MUL'){
                    result = value1Int * value2Int;
                  }else{
                    result = value1Int / value2Int;
                  }
                  //int result = int.parse(value1.value.text)+int.parse(value2.value.text);
                  sum= "$result";
                });
              } ,
                child: Row( //버튼 길어지게 하는거
                    children: [
                      Icon(Icons.abc),
                      Text(_buttonText!)
                    ]
                ),)
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: _generateRandomNumbers,
              child: Text('숫자 랜덤 뽑기'),
            ),),
          Padding(
              padding: const EdgeInsets.all(20),
              child:DropdownButton(items: _dropDownMenuItems,onChanged: (String? value){
                setState(() {
                  _buttonText =value;
                });
              },value: _buttonText,)
          )],
      ),

    );
  }
  @override
  void initState(){
    super.initState();
    for(var item in _btnList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }
}

