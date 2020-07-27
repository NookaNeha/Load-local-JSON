import 'package:flutter/material.dart';
import 'dart:convert';
void main()=> runApp(
  new MaterialApp(
    home: new HomePage(),
    ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;


  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load Local JSON"),
        backgroundColor: Colors.black54,
      ),
      body:

        new Container(
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
                builder: (context, snapshot){
                  var mydata = jsonDecode(snapshot.data.toString());

                  return new ListView.builder(
                      itemBuilder: (BuildContext context,int index){
                        return new Card(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Text("ID: "+ mydata[index]['ID']),
                              new Text("Name: "+ mydata[index]['Name']),
                              new Text("Country: "+ mydata[index]['Country']),
                              new Text("House: "+ mydata[index]['House']),
                              new Text("Reign: "+ mydata[index]['Reign']),
                            ],
                          ),
                        );
                      },
                    itemCount: mydata==null ?0 : mydata.length,
                      );
                },
            ),
          ),
        )
    );
  }
}
