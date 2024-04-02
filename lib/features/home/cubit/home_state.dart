abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class GalleryLoadingState extends HomeState {}

final class GallerySucsessState extends HomeState {}

final class GalleryFailedState extends HomeState {
  final String errorMsg;
  GalleryFailedState({required this.errorMsg});
}
