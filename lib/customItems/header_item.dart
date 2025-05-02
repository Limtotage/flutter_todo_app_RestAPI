import 'package:flutter/material.dart';

class Headeritem extends StatelessWidget {
  const Headeritem({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
            image: AssetImage("lib/assets/images/greenHeader.png"),
            fit: BoxFit.cover),
      ),
      width: deviceWidth,
      height: deviceHeight / 3,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "Bugunun Tarihi",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "My Todo List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
