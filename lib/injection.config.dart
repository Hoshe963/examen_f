// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:examen/src/data/dataSource/service/MatriculaService.dart'
    as _i821;
import 'package:examen/src/di/AppModule.dart' as _i604;
import 'package:examen/src/domain/repository/MatriculaRepository.dart' as _i593;
import 'package:examen/src/domain/useCases/CreateMatriculaUseCase.dart'
    as _i908;
import 'package:examen/src/domain/useCases/DeleteMatriculaUseCase.dart'
    as _i319;
import 'package:examen/src/domain/useCases/FetchMatriculaDetailUseCase.dart'
    as _i50;
import 'package:examen/src/domain/useCases/FetchMatriculasUseCase.dart'
    as _i352;
import 'package:examen/src/domain/useCases/UpdateMatriculaUseCase.dart'
    as _i187;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i821.MatriculaService>(() => appModule.matriculaService);
    gh.factory<_i593.MatriculaRepository>(() => appModule.matriculaRepository);
    gh.factory<_i352.FetchMatriculasUseCase>(
        () => appModule.fetchMatriculasUseCase);
    gh.factory<_i50.FetchMatriculaDetailUseCase>(
        () => appModule.fetchMatriculaDetailUseCase);
    gh.factory<_i908.CreateMatriculaUseCase>(
        () => appModule.createMatriculaUseCase);
    gh.factory<_i187.UpdateMatriculaUseCase>(
        () => appModule.updateMatriculaUseCase);
    gh.factory<_i319.DeleteMatriculaUseCase>(
        () => appModule.deleteMatriculaUseCase);
    return this;
  }
}

class _$AppModule extends _i604.AppModule {}
