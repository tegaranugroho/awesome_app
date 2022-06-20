import 'dart:convert';

import 'package:awesome_app/models/image_model.dart';
import 'package:awesome_app/models/image_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../dummy_data/dummy_object.dart';
import '../json_reader.dart';

void main() {
  const tMovieResponseModel =
      ImageResponse(imageList: <ImageModel>[imageModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/image.json'));
      // act
      final result = ImageResponse.fromJson(jsonMap);
      // assert
      expect(result, tMovieResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tMovieResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "photos": [
          {
            "id": 12133748,
            "width": 3510,
            "height": 5267,
            "url":
                "https://www.pexels.com/photo/woman-lying-in-bed-at-sunrise-12133748/",
            "photographer": "Masha Raymers",
            "photographer_url": "https://www.pexels.com/@masharaymers",
            "photographer_id": 1412204,
            "avg_color": "#3D2813",
            "src": {
              "original":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg",
              "large2x":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
              "large":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
              "medium":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg?auto=compress&cs=tinysrgb&h=350",
              "small":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg?auto=compress&cs=tinysrgb&h=130",
              "portrait":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
              "landscape":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
              "tiny":
                  "https://images.pexels.com/photos/12133748/pexels-photo-12133748.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
            },
            "liked": false,
            "alt": "Woman Lying in Bed at Sunrise"
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
