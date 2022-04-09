import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/login.dart';
import 'package:hospital/patient_profile.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}
//ss

class _SearchPageState extends State<SearchPage> {
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Text('Medical Record'),
      )),backgroundColor: Colors.blue.shade800,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_result ?? '', style: TextStyle(fontSize: 18)),

              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade800),

                          ),

                          onPressed: () async {
                            var result = await showSearch<String>(
                              context: context,
                              delegate: CustomDelegate(),
                            );
                            setState(() => _result = result);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(child: Text('Search',style: TextStyle(fontSize: 18),)),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }
}
//dd
class CustomDelegate extends SearchDelegate<String> {
  static List<String> mainDataList = [
    "3000801161082",
    "3010801161082",
    "3002801161082",
    "30055801161082",
    "23300801161082",
    "2880801161082",
    "3000801161082",
    "1990801161082",
    "3000901161082",
    "4000801161082",
    "5000801161082",
    "55000801161082",
    "7000801161082",

  ];
  List<String> data = mainDataList.take(100).toList();

  @override
  List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    var listToShow;
    if (query.isNotEmpty)
      listToShow = data.where((e) => e.contains(query) && e.startsWith(query)).toList();
    else
      listToShow = data;

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var noun = listToShow[i];
        return ListTile(
          title: Text(noun),
          onLongPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>patient_profile()));

          },
          onTap: () => close(context, noun),
        );
      },
    );
  }
}