import './features/tareas/data/datasources/tarea_rds.dart';
import './features/tareas/data/repositories/tarea_repository.dart';
import './features/tareas/domain/usecases/get_tarea.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsecaseConfig {
  GetTareaUsecase? getTareaUseCase;
  TareaRepositoryImpl? tareaRepositoryImpl;
  TareaRDS? tareaRDS;

  UsecaseConfig() {
    tareaRDS = TareaRDSImpl();
    tareaRepositoryImpl = TareaRepositoryImpl(tareaRDS: tareaRDS!);
    getTareaUseCase = GetTareaUsecase(tareaRepositoryImpl!);
  }
}
