import 'package:examen/src/domain/useCases/CreateMatriculaUseCase.dart';
import 'package:examen/src/domain/useCases/DeleteMatriculaUseCase.dart';
import 'package:examen/src/domain/useCases/FetchMatriculasUseCase.dart';
import 'package:examen/src/domain/useCases/UpdateMatriculaUseCase.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/matricula_bloc.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/matricula_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen/injection.dart'; // Importa la configuración de inyección

List<BlocProvider> blocProviders = [
  BlocProvider<MatriculaBloc>(
    create: (context) => MatriculaBloc(
      fetchMatriculasUseCase: locator<FetchMatriculasUseCase>(),
      createMatriculaUseCase: locator<CreateMatriculaUseCase>(),
      updateMatriculaUseCase: locator<UpdateMatriculaUseCase>(),
      deleteMatriculaUseCase: locator<DeleteMatriculaUseCase>(),
    )..add(FetchMatriculasEvent()), // Evento inicial para cargar las matrículas
  ),
  // Agrega más BlocProviders si es necesario
];
