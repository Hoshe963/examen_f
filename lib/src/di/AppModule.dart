import 'package:examen/src/data/dataSource/service/MatriculaService.dart';
import 'package:examen/src/data/repository/MatriculaRepositoryImpl.dart';
import 'package:examen/src/domain/repository/MatriculaRepository.dart';
import 'package:examen/src/domain/useCases/CreateMatriculaUseCase.dart';
import 'package:examen/src/domain/useCases/DeleteMatriculaUseCase.dart';
import 'package:examen/src/domain/useCases/FetchMatriculaDetailUseCase.dart';
import 'package:examen/src/domain/useCases/FetchMatriculasUseCase.dart';
import 'package:examen/src/domain/useCases/UpdateMatriculaUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  // Inyección para MatriculaService
  @injectable
  MatriculaService get matriculaService => MatriculaService();

  // Inyección para MatriculaRepository
  @injectable
  MatriculaRepository get matriculaRepository => MatriculaRepositoryImpl(matriculaService);

  // Inyección para los casos de uso de Matricula
  @injectable
  FetchMatriculasUseCase get fetchMatriculasUseCase => FetchMatriculasUseCase(matriculaRepository);

  @injectable
  FetchMatriculaDetailUseCase get fetchMatriculaDetailUseCase => FetchMatriculaDetailUseCase(matriculaRepository);

  @injectable
  CreateMatriculaUseCase get createMatriculaUseCase => CreateMatriculaUseCase(matriculaRepository);

  @injectable
  UpdateMatriculaUseCase get updateMatriculaUseCase => UpdateMatriculaUseCase(matriculaRepository);

  @injectable
  DeleteMatriculaUseCase get deleteMatriculaUseCase => DeleteMatriculaUseCase(matriculaRepository);
}
