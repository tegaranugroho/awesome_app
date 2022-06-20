import 'dart:convert';
import 'dart:io';

import 'package:awesome_app/common/helper/exception.dart';
import 'package:awesome_app/common/helper/failure.dart';
import 'package:awesome_app/models/image_model.dart';
import 'package:awesome_app/models/image_response.dart';
import 'package:awesome_app/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class RepositoryImpl extends Repository {
  static const baseUrl = 'https://api.pexels.com/v1';
  static const apiKey =
      '563492ad6f91700001000001f35db2d1bcfe4609b50c4883398780e9';
  // static const apiKey =
  //     '563492ad6f91700001000001b954f3d7c3d44d6098c53cc8a4e7f372';
  // static const apiKey =
  //     '563492ad6f9170000100000191f232f60362428b8f3becfcd7a25339';
  final http.Client client;
  RepositoryImpl({required this.client});

  @override
  Future<Either<Failure, List<ImageModel>>> getImages(
    int perPage,
  ) async {
    try {
      final response = await client.get(
          Uri.parse('$baseUrl/curated?page=$perPage&per_page=10'),
          headers: {'Authorization': apiKey});
      if (response.statusCode == 200) {
        return Right(
            ImageResponse.fromJson(json.decode(response.body)).imageList);
      }
      return Left(ConnectionFailure(response.reasonPhrase ?? ''));
    } on ServerException {
      return const Left(ServerFailure('Failed to connect to the server'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ConnectionFailure('Something went wrong! :('));
    }
  }
}
