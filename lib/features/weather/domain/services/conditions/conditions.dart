import '../../models/index.dart';

abstract interface class ConditionsService {
  Future<void> loadConditions();
  ConditionsItemModelDomain? getConditionByCode(int code);
  String getText({
    required int code,
    String? langIso,
    required bool isDay,
    String fallbackText,
  });
  String getAssetIconPath({required int code, required bool isDay});
}
