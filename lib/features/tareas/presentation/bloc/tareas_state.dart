part of 'tareas_bloc.dart';

// @immutable
abstract class TareasState {}

class TareasInitial extends TareasState {}

class TareasLoading extends TareasState {}

class TareasLoaded extends TareasState {
  final List<Tarea> tareas;

  TareasLoaded({required this.tareas});
}

class TareasError extends TareasState {
  final String message;

  TareasError({required this.message});
}
