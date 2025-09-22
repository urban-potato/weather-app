import '../../../../shared/domain/data_states/local/index.dart';
import '../models/index.dart';

abstract interface class ConditionsRepository {
  Future<LocalDataState<ConditionsModelDomain>> getConditions();
}
