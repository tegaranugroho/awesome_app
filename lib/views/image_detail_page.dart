import 'package:awesome_app/common/constant/styles.dart';
import 'package:awesome_app/common/helper/open_url.dart';
import 'package:awesome_app/models/image_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final ImageModel image;
  const ImageDetailPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(image.photographer),
                background: Hero(
                  tag: '${image.id}${image.avgColor}',
                  child: CachedNetworkImage(
                    imageUrl: image.src.medium,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: (context, progress) {
                      return FadeShimmer(
                        width: double.infinity,
                        height: 180,
                        radius: 4,
                        highlightColor: Colors.grey.shade400,
                        baseColor: Colors.white,
                      );
                    },
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              if (image.alt.isNotEmpty)
                Text(image.alt, style: kHeading6.copyWith(fontSize: 18)),
              if (image.alt.isNotEmpty) const SizedBox(height: 15),
              Table(
                border: TableBorder.all(),
                children: [
                  tableRow('Photographer Name', image.photographer),
                  tableRow('Dimensions', '${image.height} x ${image.width}'),
                  tableRow('Color', image.avgColor),
                ],
              ),
              const SizedBox(height: 10),
              Text('Resource:',
                  style: kSubtitle.copyWith(fontWeight: FontWeight.bold)),
              tappedText(image.url),
              tappedText(image.photographerUrl),
            ],
          ),
        ),
      ),
    );
  }

  tappedText(String url) {
    return InkWell(
      highlightColor: kBlue.withOpacity(0.3),
      onTap: () => openUrl(url),
      child: Text(
        url,
        style: kSubtitle.copyWith(color: kBlue),
      ),
    );
  }

  tableRow(String title, String content) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(title),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(content),
        ),
      ],
    );
  }
}
