import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Modals/itemsClass.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffE0E0E0),
        ),
        borderRadius: BorderRadius.circular(14.w),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.w),
              bottomLeft: Radius.circular(14.w),
            ),
            child: CachedNetworkImage(
              imageUrl: item.imgUrl,
              fit: BoxFit.cover,
              width: 140.w,
              height: 200.h,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
              ),
              errorWidget: (context, url, error) {
                print('Error loading image: $error');
                return const Icon(Icons.error);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.upHead.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400),
                                maxLines: 1,
                              ),
                              Text(
                                item.lowHead,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: const Color(0xff9e95a2),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 10.sp),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 32.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFF39519), Color(0xFFFFCD67)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Center(
                            child: Text(
                              "A",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                height: 16 / 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
