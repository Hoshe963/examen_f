import 'package:examen/src/domain/models/Matricula.dart';
import 'package:examen/src/domain/repository/MatriculaRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class FetchMatriculaDetailUseCase {
  final MatriculaRepository matriculaRepository;

  FetchMatriculaDetailUseCase(this.matriculaRepository);

  Future<Resource<Matricula>> call(int id) async {
    return await matriculaRepository.fetchMatriculaDetail(id);
  }
}
