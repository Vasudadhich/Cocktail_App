import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  final drink;

  const DrinkDetails({Key key, @required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(drink["strDrink"]
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                            tag: drink["idDrink"],
                                                    child: CircleAvatar(
                                                      radius: 100.0,
                              backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                           Text(
                          "ID : ${drink["idDrink"]}",
                          style: TextStyle(),
                        ),
                        SizedBox(
                            height: 30,
                          ),
                        Text(
                          "${drink["strDrink"]}",
                          style: TextStyle(fontSize: 12),
                        ),
          ],
        ),
      ),
    );
  }
}
