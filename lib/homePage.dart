import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String qr;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('a');
                },
                child: Text('bookSlot'),
              ),
            ),
            Container(
              height: 50,
            ),
            Container(
              width: 90,
              height: 90,
              child: FloatingActionButton(
                  child: Icon(Icons.scanner),
                  onPressed: () async {
                    qr = await scanner.scan();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
