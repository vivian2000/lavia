part of 'disease_cubit.dart';

@immutable
abstract class DiseaseState {}

class DiseaseInitialState extends DiseaseState {}
class DiseaseLoadingState extends DiseaseState {}
class DiseaseSuccessState extends DiseaseState {}
class DiseaseErrorState extends DiseaseState {}

