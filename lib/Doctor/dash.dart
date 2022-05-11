import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
    children: <Widget>[
      Expanded(
        child: Container(color: Colors.blue.shade900),
        flex: 2,
      ),
      Expanded(
        child: Container(color: Colors.transparent),
        flex: 5,
      ),
    ],
  );

  get content => Container(
    child: Column(
      children: <Widget>[
        header,
        grid,
      ],
    ),
  );

  get header => Padding(
    padding: const EdgeInsets.only(top: 20.0,left: 15),
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
      title: Text(
        'Dash Board',
        style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '10 items',
        style: TextStyle(color: Colors.blue),
      ),
      trailing: CircleAvatar(backgroundImage: AssetImage('image/doc.png'),),
    ),
  );

  get grid => Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .90,
        children: List.generate(8, (_) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[FlutterLogo(), Text('data')],
              ),
            ),
          );
        }),
      ),
    ),
  );
}


