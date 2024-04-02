import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/repo/home_repo.dart';

import '../models/my_gallery_data_model/my_gallery_data.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //======================
  final HomeRepo homeRepo;
  MyGalleryData? myGalleryData;
  getMYGalleryData() async {
    emit(GalleryLoadingState());
    final response = await homeRepo.getMyGallery();
    response.fold(
        (errorModel) =>
            emit(GalleryFailedState(errorMsg: errorModel.errorMessage)),
        (myGalleryData) {
      myGalleryData = myGalleryData;
      debugPrint('myGalleryData####: ${myGalleryData.data!.images!.length}');
      emit(GallerySucsessState());
    });
  }
}
