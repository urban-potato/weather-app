import 'package:equatable/equatable.dart';

class LanguagesItemModelDomain extends Equatable {
  final String langName;
  final String dayText;
  final String nightText;

  const LanguagesItemModelDomain({
    required this.langName,
    required this.dayText,
    required this.nightText,
  });

  @override
  List<Object?> get props => [langName, dayText, nightText];
}
