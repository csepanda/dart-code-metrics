import 'package:meta/meta.dart';

@immutable
class ComponentReport {
  final int averageArgumentsCount;
  final int totalArgumentsCountViolations;

  final double averageMaintainabilityIndex;
  final int totalMaintainabilityIndexViolations;

  final int totalCyclomaticComplexity;
  final int totalCyclomaticComplexityViolations;

  final int totalExecutableLinesOfCode;
  final int totalExecutableLinesOfCodeViolations;

  const ComponentReport(
      {@required this.averageArgumentsCount,
      @required this.totalArgumentsCountViolations,
      @required this.averageMaintainabilityIndex,
      @required this.totalMaintainabilityIndexViolations,
      @required this.totalCyclomaticComplexity,
      @required this.totalCyclomaticComplexityViolations,
      @required this.totalExecutableLinesOfCode,
      @required this.totalExecutableLinesOfCodeViolations});

  const ComponentReport.empty()
      : averageArgumentsCount = 0,
        totalArgumentsCountViolations = 0,
        averageMaintainabilityIndex = 0,
        totalMaintainabilityIndexViolations = 0,
        totalCyclomaticComplexity = 0,
        totalCyclomaticComplexityViolations = 0,
        totalExecutableLinesOfCode = 0,
        totalExecutableLinesOfCodeViolations = 0;
}
