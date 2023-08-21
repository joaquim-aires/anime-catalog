import 'dart:convert';
import 'package:anime_list/exceptions.dart';
import 'package:http/http.dart' as http;
import 'anime_model.dart';

class ApiResult {
  Future<List<AnimeModel>> getAnimes(String search) async {
    var url = Uri.parse('https://api.jikan.moe/v4/anime?q=$search&sfw');
    var response = await http.get(url);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<AnimeModel> animeList = [];
      final apiResult = jsonDecode(response.body);
      apiResult['data'].map((item) {
        final AnimeModel anime = AnimeModel.fromMap(item);
        animeList.add(anime);
      }).toList();

      return animeList;
    } else if (response.statusCode >= 400 && response.statusCode < 499) {
      throw NotFoundException('Network Error');
    } else if (response.statusCode >= 500 && response.statusCode < 599) {
      throw NotFoundException('Server Error');
    } else {
      throw Exception('Url not found');
    }
  }
}
