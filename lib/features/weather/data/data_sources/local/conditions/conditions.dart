import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../../../shared/domain/data_states/local/index.dart';
import '../../../../shared/resources/index.dart';
import '../../../models/index.dart';

class ConditionsLocalDataSource {
  const ConditionsLocalDataSource();

  Future<LocalDataState<ConditionsModelData>> getConditions() async {
    try {
      final jsonString = await rootBundle.loadString(AppJsons.conditions);
      final List<dynamic> jsonListDynamic = json.decode(jsonString);

      final List<Map<String, dynamic>> listJson = jsonListDynamic
          .map((e) => e as Map<String, dynamic>)
          .toList();

      final conditionModelData = ConditionsModelData.fromJson(listJson);

      return LocalDataSuccess(conditionModelData);
    } catch (e) {
      return LocalDataFailed(e);
    }
  }
}
