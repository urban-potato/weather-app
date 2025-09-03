import '../../../../shared/resources/local_data_state/index.dart';
import '../../domain/models/index.dart';
import '../../domain/repositories/index.dart';
import '../data_sources/local/index.dart';
import '../mappers/conditions.dart';

class ConditionsRepositoryImpl implements ConditionsRepository {
  final ConditionsService _conditionsService;

  ConditionsRepositoryImpl({required ConditionsService conditionsService})
    : _conditionsService = conditionsService;

  @override
  Future<LocalDataState<ConditionsModelDomain>> getConditions() async {
    try {
      final response = await _conditionsService.getConditions();

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
