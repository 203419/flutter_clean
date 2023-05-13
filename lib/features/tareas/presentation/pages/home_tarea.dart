import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tareas_bloc.dart';
import '../../domain/entities/tarea.dart';

class HomeTarea extends StatefulWidget {
  const HomeTarea({super.key});

  @override
  State<HomeTarea> createState() => _HomeTareaState();
}

class _HomeTareaState extends State<HomeTarea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas'),
      ),
      body: BlocBuilder<TareasBloc, TareasState>(
        builder: (context, state) {
          if (state is TareasLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TareasLoaded) {
            return ListView.builder(
              itemCount: state.tareas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.tareas[index].title),
                  subtitle: Text(state.tareas[index].description),
                );
              },
            );
          } else if (state is TareasError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text('Error desconocido'),
            );
          }
        },
      ),
    );
  }
}
