import 'package:examen/src/presentation/pages/listRoom/bloc/RegisterMatriculaPage.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/matricula_bloc.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/matricula_event.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/matricula_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatriculaListPage extends StatelessWidget {
  const MatriculaListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Matrículas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<MatriculaBloc>().add(FetchMatriculasEvent());
            },
          ),
        ],
      ),
      body: BlocListener<MatriculaBloc, MatriculaState>(
        listener: (context, state) {
          if (state is MatriculaDeletedSuccess ||
              state is MatriculaUpdatedSuccess) {
            context.read<MatriculaBloc>().add(FetchMatriculasEvent());
          }
        },
        child: BlocBuilder<MatriculaBloc, MatriculaState>(
          builder: (context, state) {
            if (state is MatriculaLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MatriculaLoaded) {
              final matriculas = state.matriculas;
              if (matriculas.isEmpty) {
                return const Center(
                    child: Text('No hay matrículas disponibles'));
              }
              return ListView.builder(
                itemCount: matriculas.length,
                itemBuilder: (context, index) {
                  final matricula = matriculas[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${matricula.curso} - ${matricula.estudiante}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Número de horas: ${matricula.numeroHoras}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            'Número de créditos: ${matricula.numeroCreditos}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            'Estado: ${matricula.estado}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () async {
                                  bool? result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterMatriculaPage(
                                              matricula: matricula),
                                    ),
                                  );
                                  if (result == true) {
                                    context
                                        .read<MatriculaBloc>()
                                        .add(FetchMatriculasEvent());
                                  }
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  context.read<MatriculaBloc>().add(
                                      DeleteMatriculaEvent(
                                          matricula.id!));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is MatriculaFailure) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return const Center(child: Text('No hay matrículas disponibles'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterMatriculaPage(),
            ),
          );
          if (result == true) {
            context.read<MatriculaBloc>().add(FetchMatriculasEvent());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
