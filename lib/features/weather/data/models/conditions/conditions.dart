import 'conditions_item/conditions_item.dart';

class ConditionsModelData {
  final List<ConditionsItemModelData> conditionsList;

  const ConditionsModelData({required this.conditionsList});

  factory ConditionsModelData.fromJson(List<Map<String, dynamic>> listJson) {
    return ConditionsModelData(
      conditionsList: listJson
          .map((e) => ConditionsItemModelData.fromJson(e))
          .toList(),
    );
  }

  @override
  String toString() => 'ConditionstModelData(conditionsList: $conditionsList)';
}
