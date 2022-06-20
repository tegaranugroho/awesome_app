import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  const ImageModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final Src src;
  final bool liked;
  final String alt;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: Src.fromJson(json["src"]),
        liked: json["liked"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toJson(),
        "liked": liked,
        "alt": alt,
      };

  @override
  List<Object?> get props => [
        id,
        width,
        height,
        url,
        photographer,
        photographerUrl,
        photographerId,
        avgColor,
        src,
        liked,
        alt,
      ];
}

class Src extends Equatable {
  const Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  final String original;
  final String large2X;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
      };

  @override
  List<Object?> get props => [
        original,
        large2X,
        large,
        medium,
        small,
        portrait,
        landscape,
        tiny,
      ];
}
