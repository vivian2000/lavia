part of 'get_profile_data_cubit.dart';

@immutable
abstract class GetProfileDataState {}

class GetProfileDataInitialState extends GetProfileDataState {}

/// Get Profile Date
class GetProfileDataLoadingState extends GetProfileDataState {}

class GetProfileDataSuccessState extends GetProfileDataState {}

class GetProfileDataErrorState extends GetProfileDataState {}

/// Change Profile Data
class ChangeProfileDataLoadingState extends GetProfileDataState {}

class ChangeProfileDataSuccessState extends GetProfileDataState {}

class ChangeProfileDataErrorState extends GetProfileDataState {}