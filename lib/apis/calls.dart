import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:amine_elhoussaini/apis/routes.dart';

Future getContentFromApi() async {
  final profileId = "13";
  final response = await http.get(
      Uri.parse(PRPFILE_CONTENT + "?profile=" + profileId),
      headers: {"Access-Control-Allow-Origin": "*"});

  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
  return 'error';
}
