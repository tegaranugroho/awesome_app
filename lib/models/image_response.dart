import 'package:awesome_app/models/image_model.dart';
import 'package:equatable/equatable.dart';

class ImageResponse extends Equatable {
  final List<ImageModel> imageList;

  const ImageResponse({required this.imageList});

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        imageList: List<ImageModel>.from(
            (json["photos"] as List).map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "photos": List<dynamic>.from(imageList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [imageList];
}
