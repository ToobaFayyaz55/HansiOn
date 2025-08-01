import 'dart:convert';
import 'package:http/http.dart';

class fetchMeme{
  static fetchNewMeme() async{
      Response response = await get(Uri.parse("https://meme-api.com/gimme"));

      Map body_data = jsonDecode(response.body);
      return body_data["url"];
  }
}