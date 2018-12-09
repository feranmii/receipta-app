import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
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
  Map<String, dynamic> fileContent;


  @override
  void initState()
  {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory)
    {
      dir = directory;
      jsonFile  = new File(dir.path + "/" + filename);
      fileExists = jsonFile.existsSync();
      if(fileExists)
      {

        this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
      }
    });
  }

  void createFile(Map<String, String> content, Directory dir, String filename)
  {
    print("Create file");
    File file = new File(dir.path + "/" + filename);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));


  }

  void writeToFile(String name, String merchant)
  {
    print("Write to file");
    List<Map<String, String>> content;// = {content. : merchant};
    List<Map<String, dynamic>> co = [];

    //co[co.length + 1] = content;


    print( "Hey");

    content = [{"name" : merchant, "sil":merchant}, {"name" : merchant, "sil": merchant}, ];
    if(fileExists)
    {
      print("Fiile already exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      print(content.length);
      for(int i = 0; i < content.length; i++)
        {
          jsonFileContent.addAll(content[i]);

        }

      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    }
    else
    {
      print("File does not exist");
      createFile(content[0], dir,  filename);
    }

    setState(() {
      fileContent = json.decode(jsonFile.readAsStringSync());
    });

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Future"
        ),
      ),

      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text("File Content: ", style: TextStyle(fontWeight: FontWeight.bold),),
              Text(fileContent.toString()),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text("Add To Json file "),
              Padding(padding: EdgeInsets.only(top: 20.0)),

              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent
                ),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index)
                  {
                    Text(
                     // index.toString(),
                      "SKDSDSDSD",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0
                      ),
                    );
                  },
                ),
              ),
              RaisedButton(
                child: Text("Add key, value pair"),
                onPressed: () => writeToFile("SDSdssdsdsS", "Hey-Ho"),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
