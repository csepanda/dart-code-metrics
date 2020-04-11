import 'package:meta/meta.dart';

const cyclomaticComplexityDefaultWarningLevel = 20;
const executableLinesOfCodeDefaultWarningLevel = 50;
const numberOfArgumentsDefaultWarningLevel = 4;

/// Reporter config to use with various [Reporter]s
@immutable
class Config {
  final int cyclomaticComplexityWarningLevel;
  final int executableLinesOfCodeWarningLevel;
  final int numberOfArgumentsWarningLevel;

  const Config(
      {this.cyclomaticComplexityWarningLevel =
          cyclomaticComplexityDefaultWarningLevel,
      this.executableLinesOfCodeWarningLevel =
          executableLinesOfCodeDefaultWarningLevel,
      this.numberOfArgumentsWarningLevel =
          numberOfArgumentsDefaultWarningLevel});
}
