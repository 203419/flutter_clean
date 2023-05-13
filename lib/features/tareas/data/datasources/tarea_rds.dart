import '../models/tarea_model.dart';
import '../../domain/entities/tarea.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'http://localhost:3000/tasks/';

abstract class TareaRDS {
  Future<List<TareaModel>> getTareas();
  // Future<void> addTarea(TareaModel tarea);
  // Future<void> deleteTarea(TareaModel tarea);
}

class TareaRDSImpl implements TareaRDS {
  @override
  Future<List<TareaModel>> getTareas() async {
    var rsp = await http.get(Uri.parse(url));

    if (rsp.statusCode == 200) {
      var tareas = jsonDecode(rsp.body) as List;
      return tareas.map((tarea) => TareaModel.fromJson(tarea)).toList();
    } else {
      throw Exception('Error al obtener tareas');
    }
  }
}
