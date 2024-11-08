import 'package:bloc/bloc.dart';
import 'package:examen/src/domain/models/Matricula.dart';
import 'package:examen/src/domain/useCases/CreateMatriculaUseCase.dart';
import 'package:examen/src/domain/useCases/DeleteMatriculaUseCase.dart';
import 'package:examen/src/domain/useCases/FetchMatriculasUseCase.dart';
import 'package:examen/src/domain/useCases/UpdateMatriculaUseCase.dart';
import 'package:examen/src/domain/utils/Resource.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/matricula_event.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/matricula_state.dart';

class MatriculaBloc extends Bloc<MatriculaEvent, MatriculaState> {
  final FetchMatriculasUseCase fetchMatriculasUseCase;
  final CreateMatriculaUseCase createMatriculaUseCase;
  final UpdateMatriculaUseCase updateMatriculaUseCase;
  final DeleteMatriculaUseCase deleteMatriculaUseCase;

  MatriculaBloc({
    required this.fetchMatriculasUseCase,
    required this.createMatriculaUseCase,
    required this.updateMatriculaUseCase,
    required this.deleteMatriculaUseCase,
  }) : super(MatriculaInitial()) {
    on<FetchMatriculasEvent>(_onFetchMatriculas);
    on<CreateMatriculaEvent>(_onCreateMatricula);
    on<UpdateMatriculaEvent>(_onUpdateMatricula);
    on<DeleteMatriculaEvent>(_onDeleteMatricula);
  }

  Future<void> _onFetchMatriculas(
      FetchMatriculasEvent event, Emitter<MatriculaState> emit) async {
    emit(MatriculaLoading());
    final response = await fetchMatriculasUseCase.call();

    if (response is Success<List<Matricula>>) {
      emit(MatriculaLoaded(response.data));
    } else if (response is Error<List<Matricula>>) {
      emit(MatriculaFailure(response.message));
    }
  }

  Future<void> _onCreateMatricula(
      CreateMatriculaEvent event, Emitter<MatriculaState> emit) async {
    emit(MatriculaLoading());
    final response = await createMatriculaUseCase.call(event.matricula);

    if (response is Success<Matricula>) {
      emit(MatriculaSuccess(response.data));
    } else if (response is Error<Matricula>) {
      emit(MatriculaFailure(response.message));
    }
  }

  Future<void> _onUpdateMatricula(
      UpdateMatriculaEvent event, Emitter<MatriculaState> emit) async {
    emit(MatriculaLoading());
    final response = await updateMatriculaUseCase.call(
        event.matricula.id!, event.matricula);

    if (response is Success<Matricula>) {
      emit(MatriculaUpdatedSuccess(response.data));
    } else if (response is Error<Matricula>) {
      emit(MatriculaFailure(response.message));
    }
  }

  Future<void> _onDeleteMatricula(
      DeleteMatriculaEvent event, Emitter<MatriculaState> emit) async {
    emit(MatriculaLoading());
    final response = await deleteMatriculaUseCase.call(event.id);

    if (response is Success<bool>) {
      emit(MatriculaDeletedSuccess(event.id));
    } else if (response is Error<bool>) {
      emit(MatriculaFailure(response.message));
    }
  }
}
