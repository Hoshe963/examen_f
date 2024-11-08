import 'package:examen/src/domain/models/Matricula.dart';
import 'package:examen/src/domain/utils/Resource.dart';

abstract class MatriculaRepository {
  // Método para obtener la lista de matrículas
  Future<Resource<List<Matricula>>> fetchMatriculas();

  // Método para obtener los detalles de una matrícula específica
  Future<Resource<Matricula>> fetchMatriculaDetail(int id);

  // Método para crear una nueva matrícula
  Future<Resource<Matricula>> createMatricula(Matricula matricula);

  // Método para actualizar una matrícula existente
  Future<Resource<Matricula>> updateMatricula(
      int id, Matricula matricula);

  // Método para eliminar una matrícula
  Future<Resource<bool>> deleteMatricula(int id);
}
