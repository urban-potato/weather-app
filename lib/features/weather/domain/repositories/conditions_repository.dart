import '../../../../shared/resources/local_data_state/index.dart';
import '../models/index.dart';

abstract interface class ConditionsRepository {
  Future<LocalDataState<ConditionsModelDomain>> getConditions();
}
