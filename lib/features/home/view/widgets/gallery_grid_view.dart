import 'package:flutter/material.dart';
import 'package:gallery_app/core/widgets/custom_network_img.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';

class GalleryGridView extends StatelessWidget {
  const GalleryGridView({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          itemCount: homeCubit.myGalleryData!.data!.images!.length,
          itemBuilder: (context, index) {
            return Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: CustomNetWorkImg(
                homeCubit.myGalleryData!.data!.images![index],
                elevation: 0,
                fit: BoxFit.fill,
                customRaduis: BorderRadius.circular(15),
              ),
            );
          }),
    );
  }
}
