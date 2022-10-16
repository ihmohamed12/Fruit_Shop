import 'dart:io';
import 'package:path_provider/path_provider.dart';

bool check = true;
bool correct = false;
String name='Rakib';

enum Texttype{
  email,
  passwordWithVisibility,
  passwordWithoutVisibility,


}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/User_data.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return (contents);
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;
    return file.writeAsString(counter);
  }
}

