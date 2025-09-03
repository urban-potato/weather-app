import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../../../../shared/resources/local_data_state/index.dart';
import '../../../../shared/resources/index.dart';
import '../../../models/index.dart';

class ConditionsService {
  const ConditionsService();

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
