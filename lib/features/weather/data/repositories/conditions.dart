import '../../../../shared/resources/local_data_state/index.dart';
import '../../domain/models/index.dart';
import '../../domain/repositories/index.dart';
import '../data_sources/local/index.dart';
import '../mappers/index.dart';

class ConditionsRepositoryImpl implements ConditionsRepository {
  final ConditionsLocalDataSource _conditionsLocalDataSource;

  ConditionsRepositoryImpl({
    required ConditionsLocalDataSource conditionsLocalDataSource,
  }) : _conditionsLocalDataSource = conditionsLocalDataSource;

  @override
  Future<LocalDataState<ConditionsModelDomain>> getConditions() async {
    try {
      final response = await _conditionsLocalDataSource.getConditions();

      if (response is LocalDataSuccess) {
        final conditionsModelData = response.data;

        return LocalDataSuccess(conditionsModelData!.toConditionsModelDomain());
      } else {
        return LocalDataFailed(response.error ?? Error());
      }
    } catch (e) {
      return LocalDataFailed(e);
    }
  }
}
