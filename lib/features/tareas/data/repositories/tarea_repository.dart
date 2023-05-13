import '../../domain/entities/tarea.dart';
import '../../domain/repositories/tarea_repository.dart';
import '../models/tarea_model.dart';
import '../datasources/tarea_rds.dart';

class TareaRepositoryImpl implements TareaRepository {
  final TareaRDS tareaRDS;

  TareaRepositoryImpl({required this.tareaRDS});

  @override
  Future<List<Tarea>> getTareas() async {
    return await tareaRDS.getTareas();
  }

  // @override
  // Future<void> addTarea(Tarea tarea) {
  //   // TODO: implement addTarea
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> deleteTarea(Tarea tarea) {
  //   // TODO: implement deleteTarea
  //   throw UnimplementedError();
  // }
}
