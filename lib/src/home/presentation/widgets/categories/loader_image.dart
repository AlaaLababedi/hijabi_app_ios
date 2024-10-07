// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../core/asstes/app_images.dart';

// class AvatarImageLoader extends StatelessWidget {
//   const AvatarImageLoader({
//     super.key,
//     required this.imageUrl,
//   });

//   final String? imageUrl;
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: imageUrl ?? '',
//       fit: BoxFit.cover,
//       width: 42.w,
//       height: 42.h,
//       placeholder: (context, url) => const SizedBox(),
//       errorWidget: (context, url, error) => Image.asset(
//         width: 42.w,
//         height: 42.h,
//         AppImages.cat1,
//       ),
//     );
//   }
// }

// class AvatarErrorWidget extends StatelessWidget {
//   const AvatarErrorWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey.shade400,
//       child: Image.asset(
//         AppImages.cat1,
//       ),
//     );
//   }
// }
