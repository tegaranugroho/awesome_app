import 'package:awesome_app/common/constant/styles.dart';
import 'package:awesome_app/common/helper/routes.dart';
import 'package:awesome_app/models/image_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ImageListItem extends StatelessWidget {
  final ImageModel item;
  final bool lastIndex;
  const ImageListItem({Key? key, required this.item, required this.lastIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: Key('${item.id}'),
      onTap: () => Navigator.pushNamed(
        context,
        detailImage,
        arguments: item,
      ),
      child: Container(
        margin: EdgeInsets.only(
            top: 8, left: 10, right: 10, bottom: lastIndex ? 10 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: '${item.id}${item.avgColor}',
              child: CachedNetworkImage(
                imageUrl: item.src.small,
                height: 100,
                width: 100,
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
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.photographer,
                  style: kSubtitle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('${item.height} x ${item.width}',
                    style: kBodyText.copyWith(fontSize: 11)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
