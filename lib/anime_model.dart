class AnimeModel {
  final String name;
  final String image;
  final String synopsis;

  AnimeModel({required this.name, required this.image, required this.synopsis});

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    var synopsis = '';
    if (map['synopsis'] == null) {
      synopsis = 'Synopsis not found';
    } else {
      synopsis = map['synopsis'];
    }

    return AnimeModel(
        name: map['title'],
        image: map['images']['jpg']['image_url'],
        synopsis: synopsis);
  }
}
