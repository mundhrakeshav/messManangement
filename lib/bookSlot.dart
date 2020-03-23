import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class slotLayout extends StatefulWidget {
  @override
  _slotLayoutState createState() => _slotLayoutState();
}

bool B, L, S, D;

class _slotLayoutState extends State<slotLayout> {
  _slotLayoutState() {
    B = false;
    L = false;
    S = false;
    D = false;
  }
  _buildListItem(BuildContext context, DocumentSnapshot document, String a) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            document['Slot'],
            style: Theme.of(context).textTheme.headline,
          )),
          Container(
            child: Text(document['Seats'].toString()),
          )
        ],
      ),
      onTap: () {
        document.reference.updateData({'Seats': document['Seats'] + 1});
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed('b');

        switch (a) {
          case 'Breakfast':
            B = true;
            break;
          case 'Lunch':
            L = true;
            break;
          case 'Dinner':
            D = true;
            break;
          case 'Snacks':
            S = true;
            break;

          default:
            break;
        }
      },
    );
  }

  Widget BOX(String a, BuildContext context) {
    return AlertDialog(
        title: Text("Choose your Slot"),
        content: Container(
          height: 400,
          width: 400,
          child: StreamBuilder(
              stream: Firestore.instance.collection(a).snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData)
                  return LinearProgressIndicator(
                    backgroundColor: Colors.blue,
                  );
                else {
                  return ListView.builder(
                    itemExtent: 90,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _buildListItem(
                            context, snapshot.data.documents[index], a),
                  );
                }
              }),
        ));
  }

  static RandomColor _randomColor = new RandomColor();

  Color _color = _randomColor.randomColor(colorHue: ColorHue.random);

  colrow(BuildContext context, document) {
    var color = _color;
    return Row(
      children: <Widget>[
        Expanded(
            child: Text(
          document['Slot'],
          style: TextStyle(
              fontSize: 26,
              color: Colors.indigo[900],
              fontWeight: FontWeight.w600),
        )),
        Container(
          child: Text(
            '->' + '   ' + document['Seats'].toString(),
            style: TextStyle(
                fontSize: 26,
                color: Colors.indigo[900],
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your Meal "),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .50,
                child: StreamBuilder<Object>(
                    stream:
                        Firestore.instance.collection('Breakfast').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return Card(
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        semanticContainer: false,
                        color: Colors.red[400],
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 40),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(20),
                                    ),
                                    colrow(context, snapshot.data.documents[1]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[2]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[3]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[0]),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (B == false) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BOX("Breakfast", context);
                                        });
                                  } else
                                    Navigator.of(context).pushNamed('b');
                                },
                                splashColor: Colors.lime,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Breakfast",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .50,
                child: StreamBuilder<Object>(
                    stream: Firestore.instance.collection('Lunch').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return Card(
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        semanticContainer: false,
                        color: Colors.blueAccent,
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 40),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(20),
                                    ),
                                    colrow(context, snapshot.data.documents[0]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[2]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[1]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[3]),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (L == false) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BOX("Lunch", context);
                                        });
                                  } else
                                    Navigator.of(context).pushNamed('b');
                                },
                                splashColor: Colors.lime,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Lunch",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .50,
                child: StreamBuilder<Object>(
                    stream: Firestore.instance.collection('Snacks').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return Card(
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        semanticContainer: false,
                        color: Colors.deepPurple[400],
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 40),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(20),
                                    ),
                                    colrow(context, snapshot.data.documents[0]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[2]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[1]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[3]),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (S == false) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BOX("Snacks", context);
                                        });
                                  } else
                                    Navigator.of(context).pushNamed('b');
                                },
                                splashColor: Colors.lime,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Snacks",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .50,
                child: StreamBuilder<Object>(
                    stream: Firestore.instance.collection('Dinner').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return Card(
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        semanticContainer: false,
                        color: Colors.greenAccent[400],
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 40),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(20),
                                    ),
                                    colrow(context, snapshot.data.documents[0]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[1]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[2]),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                    ),
                                    colrow(context, snapshot.data.documents[3]),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (D == false) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BOX("Dinner", context);
                                        });
                                  } else
                                    Navigator.of(context).pushNamed('b');
                                },
                                splashColor: Colors.lime,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "Dinner",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
