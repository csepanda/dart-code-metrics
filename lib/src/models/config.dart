import 'package:meta/meta.dart';

const cyclomaticComplexityDefaultWarningLevel = 20;
const executableLinesOfCodeDefaultWarningLevel = 50;
const linesOfCodeDefaultWarningLevel = 100;
const linesOfCodeInComponentDefaultWarningLevel = 1000;
const numberOfArgumentsDefaultWarningLevel = 4;

/// Reporter config to use with various [Reporter]s
@immutable
class Config {
  final int cyclomaticComplexityWarningLevel;
  final int executableLinesOfCodeWarningLevel;
  final int linesOfCodeWarningLevel;
  final int linesOfCodeInComponentWarningLevel;
  final int numberOfArgumentsWarningLevel;

  const Config({
    this.cyclomaticComplexityWarningLevel =
        cyclomaticComplexityDefaultWarningLevel,
    this.executableLinesOfCodeWarningLevel =
        executableLinesOfCodeDefaultWarningLevel,
    this.linesOfCodeWarningLevel = linesOfCodeDefaultWarningLevel,
    this.linesOfCodeInComponentWarningLevel =
        linesOfCodeInComponentDefaultWarningLevel,
    this.numberOfArgumentsWarningLevel = numberOfArgumentsDefaultWarningLevel,
  });
}
