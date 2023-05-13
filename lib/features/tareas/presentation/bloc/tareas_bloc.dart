import '../../domain/entities/tarea.dart';
import '../../domain/usecases/get_tarea.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'tareas_event.dart';
part 'tareas_state.dart';

class TareasBloc extends Bloc<TareasEvent, TareasState> {
  final GetTareaUsecase getTareas;

  TareasBloc({required this.getTareas}) : super(TareasLoading()) {
    on<GetTareasEvent>((event, emit) async {
      emit(TareasLoading());
      try {
        final tareas = await getTareas.execute();
        emit(TareasLoaded(tareas: tareas));
      } catch (e) {
        emit(TareasError(message: e.toString()));
      }
    });
  }
}
