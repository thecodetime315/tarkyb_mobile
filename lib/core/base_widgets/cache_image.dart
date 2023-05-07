import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resource/color_manager.dart';


// ignore: must_be_immutable
class CachedImage extends StatefulWidget{

  String url;
  BoxFit fit;
  double? height,width;
  BorderRadius? borderRadius;
  ColorFilter? colorFilter;
  Alignment? alignment;
  Widget? child;
  BoxShape? boxShape;
  bool? haveRadius;
  CachedImage({Key? key,
    required this.url,
    this.fit=BoxFit.fill,
    this.width,
    this.height,
    this.borderRadius,
    this.colorFilter,
    this.alignment,
    this.child,
    this.boxShape,
    this.haveRadius=true
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CachedImageState();
  }

}
class _CachedImageState extends State<CachedImage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
      imageUrl: widget.url,
      width: widget.width,
      height: widget.height,
      imageBuilder: (context, imageProvider) => Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: widget.fit,
                colorFilter: widget.colorFilter
            ),
            borderRadius: widget.haveRadius! ? widget.borderRadius??BorderRadius.circular(0):null,
            shape: widget.boxShape??BoxShape.rectangle
        ),
        alignment: widget.alignment??Alignment.center,
        child: widget.child,
      ),
      placeholder: (context, url) => Container(
        width: widget.width,height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: widget.haveRadius! ? widget.borderRadius??BorderRadius.circular(0):null,
          shape: widget.boxShape??BoxShape.rectangle,
        ),
        child: SpinKitFadingCircle(
          color: ColorManager.primary,
          size: 30.0,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: widget.width,height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: widget.haveRadius! ? widget.borderRadius??BorderRadius.circular(0):null,
            shape: widget.boxShape??BoxShape.rectangle,
            image:  DecorationImage(
              image: AssetImage(AssetsManager.splashLogo),
              fit: BoxFit.contain,
            )
        ),
      ),
    );
  }

}