import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteIcon extends StatefulWidget {
  final VoidCallback onTapFn;
  bool? initialValue;
  FavouriteIcon({
    Key? key,
    required this.onTapFn,
    this.initialValue,
  }) : super(key: key);

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool _isWishlisted = false;
  @override
  void initState() {
    _isWishlisted = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(
            () {
          widget.onTapFn();
          _isWishlisted = !_isWishlisted;
        },
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: 20.h,
        width: 20.w,
        child: Center(
            child:/* Icon(
              _isWishlisted ? Icons.favorite : Icons.favorite_border,
            )*/
          Image.asset(
            _isWishlisted
                ? 'assets/images/favourite_selected.png'
                : 'assets/images/favourite.png'
          //  fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
