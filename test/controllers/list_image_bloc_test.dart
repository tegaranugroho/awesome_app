import 'package:awesome_app/common/helper/failure.dart';
import 'package:awesome_app/controllers/list_image/list_image_bloc.dart';
import 'package:awesome_app/repositories/repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../dummy_data/dummy_object.dart';
import 'list_image_bloc_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late Repository repository;
  late ListImageBloc bloc;

  setUp(() {
    repository = MockRepository();
    bloc = ListImageBloc(repository);
  });

  group('List Image Bloc', () {
    test('should change state to initial', () {
      expect(bloc.state, ListImageInitial());
    });

    blocTest('should emit [loading, success] when data is gotten successfully',
        build: () {
          when(repository.getImages(5))
              .thenAnswer((_) async => Right(testImageList));

          return bloc;
        },
        act: (ListImageBloc bloc) => bloc.add(const OnFecthImage(5)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              ListImageLoading(),
              ListImageSuccess(false, false, images: testImageList),
            ],
        verify: (ListImageBloc bloc) {
          verify(repository.getImages(5));
        });

    blocTest('should emit [loading, error] when data is unsuccessful',
        build: () {
          when(repository.getImages(5))
              .thenAnswer((_) async => const Left(ServerFailure('')));

          return bloc;
        },
        act: (ListImageBloc bloc) => bloc.add(const OnFecthImage(5)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
              ListImageLoading(),
              const ListImageError(''),
            ],
        verify: (ListImageBloc bloc) {
          verify(repository.getImages(5));
        });
  });
}
