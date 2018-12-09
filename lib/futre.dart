import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class TryFuture extends StatefulWidget {
  @override
  TryFutureState createState() {
    return new TryFutureState();
  }
}

class TryFutureState extends State<TryFuture> {
  File jsonFile;
  Directory dir;
  String filename = "expensefile.json";
  bool fileExists = false;
  List fileContent = [];

  TextEditingController merchantController = TextEditingController();
  TextEditingController priceController = TextEditingController(text: '0.00');

  NumberFormat numberFormat;

  @override
  void initState() {
    super.initState();
    numberFormat = new NumberFormat("#,###.00");

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + filename);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        // jsonFile.writeAsStringSync('[]'); - for performing reset on the json file
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
      } else {
        jsonFile.writeAsStringSync('[]'); // default to and array
      }
    });
  }

  /// Note(Lekan) Actually this createFile() method is not really needed....
  /// I personally think you can remove it.. to shorten your code.
  void createFile(
      List<Map<String, String>> content, Directory dir, String filename) {
    print("Create file");
    File file = new File(dir.path + "/" + filename);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile({String merchantName, String price = '0.00'}) {
    print("Write to file");
//    content = [{"id": fileContent.length, "name" : merchantName, "price":price}];
    fileContent
        .add({"id": fileContent.length, "name": merchantName, "price": price});

    if (fileExists) {
      print("Fiile already exists");
      //Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      //print(content.length);
      jsonFile.writeAsStringSync(json.encode(fileContent));
    } else {
      print("File does not exist");
      createFile(fileContent, dir, filename);
    }

    setState(() {
      fileContent = json.decode(jsonFile.readAsStringSync());
    });
  }

  saveToFile(String name, String merchant) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                "File Content: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(fileContent.toString()),
              Padding(padding: EdgeInsets.only(top: 10.0)),
//                Text("Add To Json file "),
//                Padding(padding: EdgeInsets.only(top: 20.0)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: merchantController,
                      decoration: InputDecoration(labelText: 'Merchant Name'),
                    ),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Price'),
                    ),
                    RaisedButton( // TODO(Lekan): Feranmi Add validation don't let people save empty text input..
                      child: Text("Save"),
                      onPressed: () => writeToFile(
                          merchantName: merchantController.text,
                          price: priceController.text),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: fileContent.length,
                    itemBuilder: (context, index) {
                      dynamic item = fileContent[index]; // Note(Lekan): item ==isequal== Map<String, dynamic>
                      return Container(
                        padding: EdgeInsets.fromLTRB(20.0, .0, 20.0, .0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(item['name'], style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
                            SizedBox(height: 6.0,),
                            Text(numberFormat.format(num.parse(item['price'])), style: TextStyle(fontSize: 12.0, color: Colors.grey.shade600),),
                            Divider(height: 24.0,),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
