import 'dart:io';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';

bool check = true;
bool correct = false;
String name='Rakib';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}





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


class Employee {
  String name;
  String job;
  String imagePath;


  Employee(
      {required this.name,
        required this.job,
        required this.imagePath,

        });
}
