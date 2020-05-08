import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['message a counsellor','message a member'];
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 150.0,
      color: Theme.of(context).accentColor,

      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categories.length,

        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap:() {

              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 75.0,
                vertical: 23.0,
              ),
              child: Center(

                child: Text(categories[index],

                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,

                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
