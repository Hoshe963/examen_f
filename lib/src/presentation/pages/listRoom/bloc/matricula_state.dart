import 'package:equatable/equatable.dart';
import 'package:examen/src/domain/models/Matricula.dart';

abstract class MatriculaState extends Equatable {
  const MatriculaState();

  @override
  List<Object?> get props => [];
}

class MatriculaInitial extends MatriculaState {}

class MatriculaLoading extends MatriculaState {}

class MatriculaLoaded extends MatriculaState {
  final List<Matricula> matriculas;

  const MatriculaLoaded(this.matriculas);

  @override
  List<Object?> get props => [matriculas];
}

class MatriculaSuccess extends MatriculaState {
  final Matricula matricula;

  const MatriculaSuccess(this.matricula);

  @override
  List<Object?> get props => [matricula];
}

class MatriculaUpdatedSuccess extends MatriculaState {
  final Matricula matricula;

  const MatriculaUpdatedSuccess(this.matricula);

  @override
  List<Object?> get props => [matricula];
}

class MatriculaDeletedSuccess extends MatriculaState {
  final int id;

  const MatriculaDeletedSuccess(this.id);

  @override
  List<Object?> get props => [id];
}

class MatriculaFailure extends MatriculaState {
  final String error;

  const MatriculaFailure(this.error);

  @override
  List<Object?> get props => [error];
}
