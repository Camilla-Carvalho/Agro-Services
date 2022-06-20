class Carrosel {
  final int id;
  final List<Image> images;

  Carrosel({required this.id, required this.images});

  factory Carrosel.fromJson(Map<String, dynamic> json) => Carrosel(
      id: json['id'],
      images: (json['images'] as List)
          .map((image) => Image.fromJson(image))
          .toList());

  Map<String, dynamic> toJson() => {'id': id, 'images': images};
}

class Image {
  final int id;
  final String url;

  Image({required this.id, required this.url});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };
}
