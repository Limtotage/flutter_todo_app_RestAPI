import 'package:flutter/material.dart';

class AddHeaderItem extends StatelessWidget {
  const AddHeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      height: deviceHeight / 10,
      decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage("lib/assets/images/addNewTaskHeader.png"),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                size: 40,
                color: Colors.white,
              )),
          Expanded(
              child: Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
          ))
        ],
      ),
    );
  }
}
