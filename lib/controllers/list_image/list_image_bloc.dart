import 'package:awesome_app/models/image_model.dart';
import 'package:awesome_app/repositories/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_image_event.dart';
part 'list_image_state.dart';

class ListImageBloc extends Bloc<ListImageEvent, ListImageState> {
  bool _isHorizontal = false;
  int itemPage = 5;
  bool isLoadingMore = false;
  final List<ImageModel> _images = [];

  ListImageBloc(Repository repository) : super(ListImageInitial()) {
    on<OnFecthImage>((event, emit) async {
      itemPage = event.itemPage;
      emit(ListImageLoading());
      final result = await repository.getImages(itemPage);
      result.fold((failure) {
        emit(ListImageError(failure.message));
      }, (data) {
        _images.clear();
        _images.addAll(data);
        isLoadingMore = false;
        emit(ListImageSuccess(
          _isHorizontal,
          isLoadingMore,
          images: data,
        ));
      });
    });

    on<OnLoadMore>((event, emit) async {
      isLoadingMore = true;
      emit(ListImageSuccess(
        _isHorizontal,
        isLoadingMore,
        images: _images,
      ));
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => isLoadingMore = false);
      itemPage = event.perPage;
      final result = await repository.getImages(itemPage);
      result.fold((failure) {}, (data) {
        _images.addAll(data);
        isLoadingMore = false;
        emit(ListImageSuccess(
          _isHorizontal,
          isLoadingMore,
          images: _images,
        ));
      });
    });

    on<OnChangeView>((event, emit) async {
      _isHorizontal = !_isHorizontal;
      emit(ListImageSuccess(_isHorizontal, false, images: event.image));
    });
  }
}
