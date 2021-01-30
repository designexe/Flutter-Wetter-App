import 'dart:convert';

import 'package:http/http.dart' as http;

class Networker {
  final String url;

  Networker({this.url});

  Future getData() async {
    var response = await http.get(this.url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
