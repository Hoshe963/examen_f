import 'package:equatable/equatable.dart';
import 'package:examen/src/domain/models/Matricula.dart';

abstract class MatriculaEvent extends Equatable {
  const MatriculaEvent();

  @override
  List<Object?> get props => [];
}

class CreateMatriculaEvent extends MatriculaEvent {
  final Matricula matricula;

  const CreateMatriculaEvent(this.matricula);

  @override
  List<Object?> get props => [matricula];
}

class UpdateMatriculaEvent extends MatriculaEvent {
  final Matricula matricula;

  const UpdateMatriculaEvent(this.matricula);

  @override
  List<Object?> get props => [matricula];
}

class FetchMatriculasEvent extends MatriculaEvent {
  const FetchMatriculasEvent();
}

class DeleteMatriculaEvent extends MatriculaEvent {
  final int id;

  const DeleteMatriculaEvent(this.id);

  @override
  List<Object?> get props => [id];
}
