import 'dart:html';

import 'package:first_application/drink_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;
  @override
  void initState() {
    super.initState();
    fatchData();
  }

  fatchData() async {
    res = await http.get(Uri.parse(api));

    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text("My Appliction"),
          elevation: 0.0,
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemExtent: 50,
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(drink[
                                    "strDrinkThumb"] ??
                                "https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584341.jpg"),
                          ),
                        ),
                        title: Text(
                          "${drink["strDrink"]}",
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]}",
                          style: TextStyle(),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DrinkDetails(drink: drink),
                                  fullscreenDialog: true));
                        },
                      );
                    })
                : CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )));
  }
}
