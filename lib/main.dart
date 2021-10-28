import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hwk5/http.dart' as http;

void main() {
  runApp(MaterialApp(home: Hwk5()));
}

class Hwk5 extends StatefulWidget {
  @override
  //_Hwk5State createState() => _Hwk5State();
  _Hwk5State createState()
  {
    return _Hwk5State();
  }
}
class _Hwk5State extends State <Hwk5> {

  //define URL to get data from
  var url = "https://jsonplaceholder/typicode.com/photos";

  //declare variable to hole the data (after having being decoded)
  var data;

  //run initState() - to initialize actions
  @override
  void iniState() {super.initState(); fetchdata();
  }

  //define function fetchdata() - asynchronous function
  fetchdata() async
  {
    //JSON data
    var jsondata = await http.get(Uri.parse(url));

    //decoding JSON data
    data = jsonDecode(jsondata.body);
    setState(() {  });
  }

  //dispose state object
  @override
  void dispose() {super.dispose();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: data != null ?
            ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                return ListTile(
                leading: Image.network(data[index]['url']),
                    title: Text('ID: ' + data[index]['id'].toString() + 'Title: ' +data[index]['title']));
    })
            :Center(child: Text('No data')));
    }
  }