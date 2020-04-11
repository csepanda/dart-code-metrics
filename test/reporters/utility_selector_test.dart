@TestOn('vm')
import 'package:dart_code_metrics/src/models/component_record.dart';
import 'package:dart_code_metrics/src/models/config.dart';
import 'package:dart_code_metrics/src/models/function_record.dart';
import 'package:dart_code_metrics/src/models/violation_level.dart';
import 'package:dart_code_metrics/src/reporters/utility_selector.dart';
import 'package:test/test.dart';

import '../stubs_builders.dart';

void main() {
  group('UtilitySelector', () {
    test('componentReport calculate report for file', () {
      final report = UtilitySelector.componentReport(
          ComponentRecord(
              fullPath: '/home/developer/work/project/example.dart',
              relativePath: 'example.dart',
              records: Map.unmodifiable(<String, FunctionRecord>{
                'function': buildFunctionRecordStub(argumentsCount: 0),
                'function2': buildFunctionRecordStub(argumentsCount: 6),
                'function3': buildFunctionRecordStub(argumentsCount: 10),
              })),
          Config());
      expect(report.averageArgumentsCount, 5);
      expect(report.totalArgumentsCountViolations, 2);
    });
    group('functionReport calculates report for function', () {
      test('with few lines', () {
        final record = buildFunctionRecordStub(firstLine: 10, lastLine: 19);
        final report = UtilitySelector.functionReport(record, Config());

        expect(report.linesOfCode.value, 10);
        expect(report.linesOfCode.violationLevel, ViolationLevel.none);
      });

      test('with a lot of lines', () {
        final record = buildFunctionRecordStub(firstLine: 100, lastLine: 219);
        final report = UtilitySelector.functionReport(record, Config());

        expect(report.linesOfCode.value, 120);
        expect(report.linesOfCode.violationLevel, ViolationLevel.warning);
      });

      test('without arguments', () {
        final record = buildFunctionRecordStub(argumentsCount: 0);
        final report = UtilitySelector.functionReport(record, Config());

        expect(report.argumentsCount.value, 0);
        expect(report.argumentsCount.violationLevel, ViolationLevel.none);
      });

      test('with a lot of arguments', () {
        final record = buildFunctionRecordStub(argumentsCount: 10);
        final report = UtilitySelector.functionReport(record, Config());
        expect(report.argumentsCount.value, 10);
        expect(report.argumentsCount.violationLevel, ViolationLevel.alarm);
      });
    });
    test(
        'functionViolationLevel return aggregated violation level for function',
        () {
      expect(
          UtilitySelector.functionViolationLevel(buildFunctionReportStub(
              cyclomaticComplexityViolationLevel: ViolationLevel.warning,
              executableLinesOfCodeViolationLevel: ViolationLevel.noted,
              maintainabilityIndexViolationLevel: ViolationLevel.none)),
          ViolationLevel.warning);

      expect(
          UtilitySelector.functionViolationLevel(buildFunctionReportStub(
              cyclomaticComplexityViolationLevel: ViolationLevel.warning,
              executableLinesOfCodeViolationLevel: ViolationLevel.alarm,
              maintainabilityIndexViolationLevel: ViolationLevel.none)),
          ViolationLevel.alarm);

      expect(
          UtilitySelector.functionViolationLevel(buildFunctionReportStub(
              cyclomaticComplexityViolationLevel: ViolationLevel.none,
              executableLinesOfCodeViolationLevel: ViolationLevel.none,
              maintainabilityIndexViolationLevel: ViolationLevel.noted)),
          ViolationLevel.noted);

      expect(
          UtilitySelector.functionViolationLevel(buildFunctionReportStub(
              cyclomaticComplexityViolationLevel: ViolationLevel.none,
              executableLinesOfCodeViolationLevel: ViolationLevel.none,
              argumentsCountViolationLevel: ViolationLevel.warning)),
          ViolationLevel.warning);

      expect(
          UtilitySelector.functionViolationLevel(buildFunctionReportStub(
              executableLinesOfCodeViolationLevel: ViolationLevel.none,
              linesOfCodeViolationLevel: ViolationLevel.alarm,
              argumentsCountViolationLevel: ViolationLevel.warning)),
          ViolationLevel.alarm);
    });
    test('isIssueLevel', () {
      const violationsMapping = {
        ViolationLevel.none: isFalse,
        ViolationLevel.noted: isFalse,
        ViolationLevel.warning: isTrue,
        ViolationLevel.alarm: isTrue,
      };

      assert(violationsMapping.keys.length == ViolationLevel.values.length);

      violationsMapping.forEach((key, value) {
        expect(UtilitySelector.isIssueLevel(key), value);
      });
    });
  });
}
