import 'package:awesome_app/common/constant/styles.dart';
import 'package:awesome_app/common/helper/routes.dart';
import 'package:awesome_app/models/image_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ImageGridItem extends StatelessWidget {
  final ImageModel item;
  const ImageGridItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        detailImage,
        arguments: item,
      ),
      child: Stack(
        children: [
          Hero(
            tag: '${item.id}${item.avgColor}',
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              imageUrl: item.src.medium,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  FadeShimmer(
                height: 100,
                width: 100,
                radius: 4,
                highlightColor: Colors.grey.shade400,
                baseColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
              child: Text(
                item.photographer,
                style: kSubtitle.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
