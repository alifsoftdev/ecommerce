import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageNetwork extends StatefulWidget {
  final String imageUrl;
  const CustomImageNetwork({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<CustomImageNetwork> createState() => _CustomImageNetworkState();
}

class _CustomImageNetworkState extends State<CustomImageNetwork> {
  @override
  Widget build(BuildContext context) {
    return  Image.network(
      widget.imageUrl,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Image.asset('assets/images/logo.png'),
        );
      },
      loadingBuilder: (BuildContext context, Widget image, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return image;
        return SizedBox(
          height: 5.h,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },

    );
  }
}
