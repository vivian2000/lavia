part of 'crop_cubit.dart';

@immutable
abstract class CropState {}

class CropInitial extends CropState {}

class CropLoadingState extends CropState {}

class CropSuccessState extends CropState {}

class CropErrorState extends CropState {}
