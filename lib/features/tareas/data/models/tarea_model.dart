import '../../domain/entities/tarea.dart';

class TareaModel extends Tarea {
  TareaModel({
    required int id,
    required String title,
    required String description,
  }) : super(
          id: id,
          title: title,
          description: description,
        );

  factory TareaModel.fromJson(Map<String, dynamic> json) {
    return TareaModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  factory TareaModel.fromEntity(Tarea tarea) {
    return TareaModel(
      id: tarea.id,
      title: tarea.title,
      description: tarea.description,
    );
  }
}
