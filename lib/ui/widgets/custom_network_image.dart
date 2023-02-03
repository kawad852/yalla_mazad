import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yalla_mazad/utils/api_url.dart';
import 'package:yalla_mazad/utils/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final String defaultUrl;
  final double radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BoxFit boxFit;

  const CustomNetworkImage({
    Key? key,
    required this.url,
    required this.defaultUrl,
    required this.radius,
    this.width,
    this.height,
    this.margin,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${ApiUrl.mainUrl}/$url",
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: MyColors.greyED0,
          borderRadius: BorderRadius.circular(radius),
          image:  DecorationImage(
            image: AssetImage(defaultUrl),
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        margin: margin,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.greyED0,
          borderRadius: BorderRadius.circular(radius),
          image:  DecorationImage(
            image: AssetImage(defaultUrl),
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
