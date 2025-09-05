import '../../../../shared/resources/local_data_state/index.dart';
import '../../domain/models/index.dart';
import '../../domain/repositories/index.dart';
import '../data_sources/local/index.dart';
import '../mappers/index.dart';

class ConditionsRepositoryImpl implements ConditionsRepository {
  final ConditionsClient _conditionsService;

  ConditionsRepositoryImpl({required ConditionsClient conditionsService})
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
