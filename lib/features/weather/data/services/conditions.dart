import '../../../../shared/resources/local_data_state/index.dart';
import '../../domain/models/index.dart';
import '../../domain/services/index.dart';
import '../../domain/usecases/index.dart';
import '../../shared/resources/index.dart';

class ConditionsServiceImpl implements ConditionsService {
  ConditionsServiceImpl({required GetConditionsUseCase getConditionsUseCase})
    : _getConditionsUseCase = getConditionsUseCase;

  final GetConditionsUseCase _getConditionsUseCase;
  ConditionsModelDomain? _conditions;

  // Must be called and completed before using an instance of the class
  @override
  Future<void> loadConditions() async {
    if (_conditions != null) return;

    final dataState = await _getConditionsUseCase();

    if (dataState is LocalDataSuccess && dataState.data != null) {
      _conditions = dataState.data;
    }
  }

  @override
  ConditionsItemModelDomain? getConditionByCode(int code) {
    return _conditions?.conditionsMap[code];
  }

  @override
  String getText({
    required int code,
    String? langIso,
    required bool isDay,
    String fallbackText = '',
  }) {
    final condition = getConditionByCode(code);
    if (condition == null) return fallbackText;

    return isDay
        ? condition.languages[langIso]?.dayText ?? condition.dayTextEng
        : condition.languages[langIso]?.nightText ?? condition.nightTextEng;
  }

  @override
  String getAssetIconPath({required int code, required bool isDay}) {
    final condition = getConditionByCode(code);
    if (condition == null) return '';

    final iconNumber = condition.iconNumber;

    return isDay
        ? AppImages.weatherIcons.getDayIcon(iconNumber)
        : AppImages.weatherIcons.getNightIcon(iconNumber);
  }
}
