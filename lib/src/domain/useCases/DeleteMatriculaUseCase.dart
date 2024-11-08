import 'package:examen/src/domain/repository/MatriculaRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class DeleteMatriculaUseCase {
  final MatriculaRepository matriculaRepository;

  DeleteMatriculaUseCase(this.matriculaRepository);

  Future<Resource<bool>> call(int id) async {
    return await matriculaRepository.deleteMatricula(id);
  }
}
