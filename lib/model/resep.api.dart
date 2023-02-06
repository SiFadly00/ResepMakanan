import 'dart:convert';
// import 'package:resep_makanan/main.dart';
import 'package:http/http.dart' as http;
import 'package:resep_makanan/model/resep.dart';

class ResepApi {
// const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "24",
// 	"start": "0"
// });

// req.headers({
// 	"X-RapidAPI-Key": "029f8e69bcmsh6d3990721fc1b9ep1efa85jsnf7ba25208f7f",
// 	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
// 	"useQueryString": true
// });

  static Future<List<Resep>> getResep() async {
    var url = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "20", "tags": "under_30_minutes"});

    final resPonse = await http.get(url, headers: {
      "X-RapidAPI-Key": "029f8e69bcmsh6d3990721fc1b9ep1efa85jsnf7ba25208f7f",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(resPonse.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Resep.resepfromSnapshot(_temp);
  }
}
