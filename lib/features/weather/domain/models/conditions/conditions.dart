import 'package:equatable/equatable.dart';

import 'conditions_item/conditions_item.dart';

class ConditionsModelDomain extends Equatable {
  final Map<int, ConditionsItemModelDomain> conditionsMap;

  const ConditionsModelDomain({required this.conditionsMap});

  @override
  List<Object?> get props => [conditionsMap];
}
