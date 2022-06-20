part of 'list_image_bloc.dart';

abstract class ListImageEvent extends Equatable {
  const ListImageEvent();

  @override
  List<Object> get props => [];
}

class OnFecthImage extends ListImageEvent {
  final int itemPage;

  const OnFecthImage(this.itemPage);

  @override
  List<Object> get props => [itemPage];
}

class OnLoadMore extends ListImageEvent {
  final int perPage;

  const OnLoadMore(this.perPage);

  @override
  List<Object> get props => [perPage];
}

class OnChangeView extends ListImageEvent {
  final List<ImageModel> image;

  const OnChangeView({this.image = const []});

  @override
  List<Object> get props => [image];
}
