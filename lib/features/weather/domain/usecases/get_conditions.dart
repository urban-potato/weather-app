import '../../../../shared/domain/data_states/local/index.dart';
import '../../../../shared/domain/usecases/usecase.dart';
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
