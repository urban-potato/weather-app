import '../../../../shared/resources/local_data_state/index.dart';
import '../../../../shared/usecases/usecase.dart';
import '../models/index.dart';
import '../repositories/index.dart';

class GetConditionsUseCase
    implements UseCase<LocalDataState<ConditionsModelDomain>, void> {
  final ConditionsRepository _conditionsRepository;

  GetConditionsUseCase({required ConditionsRepository conditionsRepository})
    : _conditionsRepository = conditionsRepository;

  @override
  Future<LocalDataState<ConditionsModelDomain>> call({void params}) {
    return _conditionsRepository.getConditions();
  }
}
