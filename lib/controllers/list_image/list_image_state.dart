part of 'list_image_bloc.dart';

abstract class ListImageState extends Equatable {
  const ListImageState();

  @override
  List<Object> get props => [];
}

class ListImageInitial extends ListImageState {}

class ListImageLoading extends ListImageState {}

class ListImageSuccess extends ListImageState {
  final List<ImageModel> images;
  final bool isHorizontal;
  final bool loadingMore;

  const ListImageSuccess(this.isHorizontal, this.loadingMore, {this.images = const []});

  @override
  List<Object> get props => [images, isHorizontal, loadingMore];
}

class ListImageError extends ListImageState {
  final String message;

  const ListImageError(this.message);

  @override
  List<Object> get props => [message];
}
