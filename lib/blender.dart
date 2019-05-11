import 'package:flutter/material.dart';
import 'recipe.dart';


class Blender extends StatefulWidget {
  @override
  _BlenderState createState() => _BlenderState();
}

class _BlenderState extends State<Blender> {
  List<Widget> _listWidgets;
  List<int> _listProducts;
  Widget _empty;

  @override
  void initState() {
    super.initState();
    _listWidgets = List();
    _listProducts = List();
    _empty = Container(width: 85.0, height: 85.0);
    for(int i = 0; i < 11; i++) _listWidgets.add(_empty);
    _getList();
  }

  _getList() async{
    _listWidgets.clear();
    _listProducts.clear();
    for(int i = 0; i < 11; i++){
      _listWidgets.add(
          Draggable(
            data: '$i',
            child: SizedBox(
                height: 85.0,
                child: Image.asset('assets/$i.png')
            ),
            feedback: SizedBox(
                height: 90.0,
                child: Image.asset('assets/$i.png')
            ),
            childWhenDragging: _empty,
          )
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _listWidgets[0],
                _listWidgets[2],
                _listWidgets[1],
                _listWidgets[3]
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _listWidgets[4],
                _listWidgets[5],
                _listWidgets[6]
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _listWidgets[7],
                _listWidgets[8],
                _listWidgets[9],
                _listWidgets[10]
              ],
            ),
            Expanded(
              child: Center(
                child: DragTarget(builder: (context, List<String> candidateData, rejectedData) {
                  return SizedBox(
                    height: 230.0,
                    child: Image.asset('assets/blender.png'),
                  );
                }, onWillAccept: (data) {
                  return true;
                }, onAccept: (data) {
                  int item = int.parse(data);
                  _listProducts.add(item);
                  _listWidgets[item] = _empty;
                  setState(() {});
                },),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                    onTap: (){
                      _getList();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black87, width: 5.0))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'reset',
                          style: TextStyle(color: Colors.black87, fontSize: 25.0, fontFamily: 'Sofia-Regular'),
                        ),
                      ),
                    )
                ),
                GestureDetector(
                  onTap: (){
                    if(_listProducts.length < 2) return;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Recipe(_listProducts)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black87, width: 5.0))
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'see recipe',
                        style: TextStyle(color: Colors.black87, fontSize: 25.0, fontFamily: 'Sofia-Regular'),
                      ),
                    ),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}