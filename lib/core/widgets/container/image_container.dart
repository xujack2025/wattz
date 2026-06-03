import 'package:flutter/cupertino.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.width = 250,
    this.height = 150,
    required this.image,
    this.borderRadius = 16,
  });

  final double? width;
  final double? height;
  final String image;
  final double borderRadius;

  ImageProvider get imageProvider {
    if (image.startsWith('http')) {
      return NetworkImage(image);
    }

    return AssetImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
      ),
    );
  }
}
