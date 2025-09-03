import 'package:equatable/equatable.dart';

import 'languages_item/languages_item.dart';

class ConditionsItemModelDomain extends Equatable {
  final String dayTextEng;
  final String nightTextEng;
  final int iconNumber;
  final Map<String, LanguagesItemModelDomain> languages;

  const ConditionsItemModelDomain({
    required this.dayTextEng,
    required this.nightTextEng,
    required this.iconNumber,
    required this.languages,
  });

  @override
  List<Object?> get props => [dayTextEng, nightTextEng, iconNumber, languages];
}
