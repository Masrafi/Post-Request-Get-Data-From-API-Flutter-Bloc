import 'dart:convert';
import 'dart:math';

import 'package:apicalling/model/model.dart';
import 'package:http/http.dart';

class Repository {
  String url = "https://www.bdtender.com/api/show-wish-list";
  getData(String email) async {
    Response response = await post(Uri.parse(url), body: {"Email": email});
    //if (response.body == 200) {
    List result = jsonDecode(response.body);
    return result.map((e) => ApiModel.fromJson(e)).toList();
    // } else {
    //   throw Exception(response.reasonPhrase);
    // }
  }
}
