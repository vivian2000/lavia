part of 'cam_cubit.dart';

@immutable
abstract class CamState {}

class CamInitialState extends CamState {}
class CamLoadingState extends CamState {}
class CamSuccessState extends CamState {}
class CamErrorState extends CamState {}