import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/view/widgets/gallery_show_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);

        return state is GalleryLoadingState
            ? const CupertinoActivityIndicator()
            : state is GalleryFailedState ||
                    homeCubit.myGalleryData!.data!.images!.isEmpty
                ? const Text("No DataFound")
                : const GalleryShowView();
      },
    );
  }
}
