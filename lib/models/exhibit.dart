class Exhibit {
  String title;
  List<String> images;

  Exhibit.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        images = (json['images'] as List).map((e) => e as String).toList();
}
