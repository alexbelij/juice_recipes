import 'package:flutter/material.dart';


class Recipe extends StatelessWidget{
  final List<int> _listProducts;
  final List<String> _listNames = [
    'Apple..1',
    'Strawberry..5',
    'Orange..1',
    'Pineapple..1/4',
    'Banana..1/4',
    'Carrot..2',
    'Plum..3',
    'Peach..1',
    'Kiwifruit..2',
    'Lemon..1/4',
    'Celery..1/2'
  ];

  Recipe(this._listProducts);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Recipe',
                  style: TextStyle(color: Colors.black87, fontSize: 35.0, fontFamily: 'Sofia-Regular'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ',
                  style: TextStyle(color: Colors.black87, fontSize: 10.0, fontFamily: 'Sofia-Regular', fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: ListView.builder(
                    itemCount: _listProducts.length,
                    itemBuilder: (context, index){
                      return Text(
                        _listNames[_listProducts[index]],
                        style: TextStyle(color: Colors.black87, fontSize: 18.0)
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black87, width: 5.0))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'close',
                          style: TextStyle(color: Colors.black87, fontSize: 25.0, fontFamily: 'Sofia-Regular'),
                        ),
                      ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}