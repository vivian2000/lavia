part of 'embedded_data_cubit.dart';

@immutable
abstract class EmbeddedDataState {}

/// GEt Graph
class EmbeddedDataInitialState extends EmbeddedDataState {}

class EmbeddedDataLoadingState extends EmbeddedDataState {}

class EmbeddedDataSuccessState extends EmbeddedDataState {}

class EmbeddedDataErrorState extends EmbeddedDataState {}

/// Get Data In Top Screen
class EmbeddedInTopDataLoadingState extends EmbeddedDataState {}

class EmbeddedInTopDataSuccessState extends EmbeddedDataState {}

class EmbeddedInTopDataErrorState extends EmbeddedDataState {}
