import 'package:dart_code_metrics/src/models/function_report_metric.dart';
import 'package:meta/meta.dart';

@immutable
class FunctionReport {
  final FunctionReportMetric<int> cyclomaticComplexity;
  final FunctionReportMetric<int> executableLinesOfCode;
  final FunctionReportMetric<double> maintainabilityIndex;
  final FunctionReportMetric<int> argumentsCount;

  const FunctionReport(
      {@required this.cyclomaticComplexity,
      @required this.executableLinesOfCode,
      @required this.maintainabilityIndex,
      @required this.argumentsCount});
}
