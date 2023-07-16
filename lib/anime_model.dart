class AnimeModel {
  final String name;
  final String image;

  AnimeModel({required this.name, required this.image});

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      name: map['title'],
      image: map['images']['jpg']['image_url'],
    );
  }
}