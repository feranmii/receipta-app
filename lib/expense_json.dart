import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class ExpenseJson{
  File jsonFile;
  Directory dir;
  String filename = "expenses.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  void initialize()
  {
    getApplicationDocumentsDirectory().then((Directory directory)
    {
      dir = directory;
      jsonFile = new File(dir.path + "/" + filename);
      fileExists = jsonFile.existsSync();
//      if(fileExists)
//        {
//
//        }
    });
  }

  void createFile(Map<String, String> content, Directory dir, String filename)
  {
    print("Create File");
    File file  =new File(dir.path + "/" + filename);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, String value)
  {
    print("Write to File");
    Map<String, String> content = {key: value};
    if(fileExists)
      {
        print("File already exists");
        Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
        jsonFileContent.addAll(content);
        jsonFile.writeAsStringSync(json.encode(jsonFileContent));

      }
      else
        {
          print("File does not exist");
          createFile(content, dir, filename);

        }


  }
}