import '../entities/tarea.dart';
import '..//repositories/tarea_repository.dart';

class GetTareaUsecase {
  final TareaRepository repository;

  GetTareaUsecase(this.repository);

  Future<List<Tarea>> execute() async {
    return await repository.getTareas();
  }
}
