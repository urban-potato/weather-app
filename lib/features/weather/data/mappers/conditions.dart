import '../../domain/models/index.dart';
import '../models/index.dart';

extension ConvertToConditionsModelDomain on ConditionsModelData {
  ConditionsModelDomain toConditionsModelDomain() {
    final Map<int, ConditionsItemModelDomain> conditionsMapDomain = {};

    for (ConditionsItemModelData c in conditionsList) {
      final Map<String, LanguagesItemModelDomain> languagesDomain = {};

      for (var l in c.languages) {
        languagesDomain[l.langIso] = LanguagesItemModelDomain(
          langName: l.langName,
          dayText: l.dayText,
          nightText: l.nightText,
        );
      }

      conditionsMapDomain[c.code] = ConditionsItemModelDomain(
        dayTextEng: c.day,
        nightTextEng: c.night,
        iconNumber: c.icon,
        languages: languagesDomain,
      );
    }

    return ConditionsModelDomain(conditionsMap: conditionsMapDomain);
  }
}
