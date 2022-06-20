import 'dart:async';

import 'package:awesome_app/common/constant/constant.dart';
import 'package:awesome_app/common/constant/styles.dart';
import 'package:awesome_app/controllers/list_image/list_image_bloc.dart';
import 'package:awesome_app/views/widgets/image_grid_item.dart';
import 'package:awesome_app/views/widgets/image_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  late ListImageBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ListImageBloc>(context);
    Future.microtask(() => bloc.add(const OnFecthImage(5)));
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        // you are at top position
      } else {
        if (bloc.state is ListImageSuccess && !bloc.isLoadingMore) {
          bloc.add(
            OnLoadMore(context.read<ListImageBloc>().itemPage + 1),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(appTitle),
        actions: [
          BlocBuilder<ListImageBloc, ListImageState>(
            builder: (context, state) {
              if (state is ListImageSuccess) {
                return InkWell(
                  onTap: () => bloc.add(OnChangeView(image: state.images)),
                  child: Icon(
                    state.isHorizontal
                        ? Icons.grid_view_rounded
                        : Icons.view_agenda_sharp,
                  ),
                );
              }
              return Container();
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<ListImageBloc, ListImageState>(
        builder: (context, state) {
          if (state is ListImageLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (state is ListImageSuccess) {
            return RefreshIndicator(
              onRefresh: () async => bloc.add(const OnFecthImage(5)),
              child: Stack(
                children: [
                  if (state.isHorizontal)
                    Stack(
                      children: [
                        GridView.builder(
                          controller: _scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: state.images.length,
                          itemBuilder: (context, index) {
                            final item = state.images[index];
                            return ImageGridItem(item: item);
                          },
                        ),
                      ],
                    ),
                  if (!state.isHorizontal)
                    ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: state.images.length,
                      itemBuilder: (context, index) {
                        final item = state.images[index];
                        return ImageListItem(
                          item: item,
                          lastIndex: index == state.images.length - 1,
                        );
                      },
                    ),
                  if (state.loadingMore)
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: LinearProgressIndicator(),
                    )
                ],
              ),
            );
          } else if (state is ListImageError) {
            return Center(
              key: const Key('error_widgets'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  const SizedBox(height: 5),
                  TextButton(
                    style: textButtonStyle,
                    onPressed: () => bloc.add(const OnFecthImage(5)),
                    child: Text(
                      'Retry',
                      style: kSubtitle.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
