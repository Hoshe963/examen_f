import 'package:examen/src/data/dataSource/service/MatriculaService.dart';
import 'package:examen/src/domain/models/Matricula.dart';
import 'package:examen/src/domain/repository/MatriculaRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class MatriculaRepositoryImpl implements MatriculaRepository {
  final MatriculaService matriculaService;

  MatriculaRepositoryImpl(this.matriculaService);

  // Implementación del método para obtener la lista de matrículas
  @override
  Future<Resource<List<Matricula>>> fetchMatriculas() {
    return matriculaService.fetchMatriculas();
  }

  // Implementación del método para obtener los detalles de una matrícula específica
  @override
  Future<Resource<Matricula>> fetchMatriculaDetail(int id) {
    return matriculaService.fetchMatriculaDetail(id);
  }

  // Implementación del método para crear una nueva matrícula
  @override
  Future<Resource<Matricula>> createMatricula(Matricula matricula) {
    return matriculaService.createMatricula(matricula);
  }

  // Implementación del método para actualizar una matrícula existente
  @override
  Future<Resource<Matricula>> updateMatricula(
      int id, Matricula matricula) {
    return matriculaService.updateMatricula(id, matricula);
  }

  // Implementación del método para eliminar una matrícula
  @override
  Future<Resource<bool>> deleteMatricula(int id) {
    return matriculaService.deleteMatricula(id);
  }
}
