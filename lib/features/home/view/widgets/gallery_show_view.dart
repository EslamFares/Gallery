import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/view/widgets/gallery_buttons.dart';
import 'package:gallery_app/features/home/view/widgets/gallery_grid_view.dart';

import 'gallery_app_bar.dart';

class GalleryShowView extends StatelessWidget {
  const GalleryShowView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Column(
          children: [
            GalleryAppBar(name: homeCubit.userName),
            const GalleryButtons(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GalleryGridView(homeCubit: homeCubit),
              ),
            )
          ],
        );
      },
    );
  }
}
