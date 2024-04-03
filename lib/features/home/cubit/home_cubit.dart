import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/cash/getstorage_helper.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/repo/home_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../models/my_gallery_data_model/my_gallery_data.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //======================
  final HomeRepo homeRepo;
  MyGalleryData? myGalleryData;
  String userName = "Eslam";
  getMYGalleryData() async {
    emit(GalleryLoadingState());
    final response = await homeRepo.getMyGallery();
    response.fold(
        (errorModel) =>
            emit(GalleryFailedState(errorMsg: errorModel.errorMessage)),
        (myGalleryDataCome) {
      myGalleryData = myGalleryDataCome;
      emit(GallerySucsessState());
    });
    userName = GetStorageHelper.readData("username") ?? "Eslam";
  }

  upLaodImage(XFile image) async {
    emit(UploadImgLoadingState());
    final response = await homeRepo.uplaodImagToServer(image: image);
    response
        .fold((errorModel) => emit(UploadImgFailedState(errorMsg: errorModel)),
            (imagedone) {
      emit(UploadImgSucsessState());
    });
  }
}
