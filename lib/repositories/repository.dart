import 'package:awesome_app/common/helper/failure.dart';
import 'package:awesome_app/models/image_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<ImageModel>>> getImages(int perPage);
}
