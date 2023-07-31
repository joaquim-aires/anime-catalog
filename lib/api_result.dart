import 'dart:convert';
import 'package:anime_list/exceptions.dart';
import 'package:http/http.dart' as http;
import 'anime_model.dart';

class ApiResult {
  Future<List<AnimeModel>> getAnimes(String search) async {
    var url = Uri.parse('https://api.jikan.moe/v4/anime?q=$search&sfw');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List<AnimeModel> animeList = [];
      final apiResult = jsonDecode(response.body);
      apiResult['data'].map((item) {
        final AnimeModel anime = AnimeModel.fromMap(item);
        animeList.add(anime);
      }).toList();

      return animeList;
    } else if (response.statusCode == 404) {
      throw NotFoundException('Erro ao buscar os dados');
    } else {
      throw Exception('Url nao encontrada');
    }
  }
}
