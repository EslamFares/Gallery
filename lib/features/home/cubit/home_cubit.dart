import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/cash/getstorage_helper.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/repo/home_repo.dart';

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
      debugPrint('myGalleryData####: ${myGalleryData!.data!.images!.length}');
      emit(GallerySucsessState());
    });
    userName = GetStorageHelper.readData("username") ?? "Eslam";
  }

  upLaodImage(MultipartFile image) async {
    emit(UploadImgLoadingState());
    final response = await homeRepo.uplaodImag(image: image);
    response.fold(
        (errorModel) =>
            emit(UploadImgFailedState(errorMsg: errorModel.errorMessage)),
        (imagedone) {
      debugPrint('imagedone####: ${imagedone.message}');
      emit(UploadImgSucsessState());
    });
  }
}
