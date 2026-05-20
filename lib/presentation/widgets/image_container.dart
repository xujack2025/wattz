import 'package:flutter/cupertino.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.width = 250,
    this.height = 150,
    required this.image,
  });

  final double? width;
  final double? height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
      ),
    );
  }
}
