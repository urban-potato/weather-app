import '../../../../../shared/resources/local_data_state/index.dart';
import '../../../domain/models/index.dart';
import '../../../domain/usecases/index.dart';
import '../../resources/index.dart';

class ConditionsHelper {
  ConditionsHelper({required GetConditionsUseCase getConditionsUseCase})
    : _getConditionsUseCase = getConditionsUseCase;

  final GetConditionsUseCase _getConditionsUseCase;
  ConditionsModelDomain? _conditions;

  Future<void> loadConditions() async {
    if (_conditions != null) return;

    final dataState = await _getConditionsUseCase();

    if (dataState is LocalDataSuccess && dataState.data != null) {
      _conditions = dataState.data;
    }
  }

  ConditionsItemModelDomain? getConditionByCode(int code) {
    return _conditions?.conditionsMap[code];
  }

  String? getText({required int code, String? langIso, required bool isDay}) {
    final condition = getConditionByCode(code);
    if (condition == null) return null;

    return isDay
        ? condition.languages[langIso]?.dayText ?? condition.dayTextEng
        : condition.languages[langIso]?.nightText ?? condition.nightTextEng;
  }

  String? getAssetIconPath({required int code, required bool isDay}) {
    final condition = getConditionByCode(code);
    if (condition == null) return null;

    final iconNumber = condition.iconNumber;

    return isDay
        ? AppImages.weatherIcons.getDayIcon(iconNumber)
        : AppImages.weatherIcons.getNightIcon(iconNumber);
  }
}
