import 'package:examen/src/domain/models/Matricula.dart';
import 'package:examen/src/domain/repository/MatriculaRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class CreateMatriculaUseCase {
  final MatriculaRepository matriculaRepository;

  CreateMatriculaUseCase(this.matriculaRepository);

  Future<Resource<Matricula>> call(Matricula matricula) async {
    return await matriculaRepository.createMatricula(matricula);
  }
}
