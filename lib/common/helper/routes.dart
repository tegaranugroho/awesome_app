import 'package:awesome_app/models/image_model.dart';
import 'package:awesome_app/views/home_page.dart';
import 'package:awesome_app/views/image_detail_page.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/';
const String detailImage = '/detail-image';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case detailImage:
      final image = settings.arguments as ImageModel;
      return MaterialPageRoute(builder: (_) => ImageDetailPage(image: image));
    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found :('),
          ),
        );
      });
  }
}
