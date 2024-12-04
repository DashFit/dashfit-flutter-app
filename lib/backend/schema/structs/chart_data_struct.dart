// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChartDataStruct extends FFFirebaseStruct {
  ChartDataStruct({
    List<double>? yAxis,
    List<int>? xAxis,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _yAxis = yAxis,
        _xAxis = xAxis,
        super(firestoreUtilData);

  // "yAxis" field.
  List<double>? _yAxis;
  List<double> get yAxis => _yAxis ?? const [];
  set yAxis(List<double>? val) => _yAxis = val;

  void updateYAxis(Function(List<double>) updateFn) {
    updateFn(_yAxis ??= []);
  }

  bool hasYAxis() => _yAxis != null;

  // "xAxis" field.
  List<int>? _xAxis;
  List<int> get xAxis => _xAxis ?? const [];
  set xAxis(List<int>? val) => _xAxis = val;

  void updateXAxis(Function(List<int>) updateFn) {
    updateFn(_xAxis ??= []);
  }

  bool hasXAxis() => _xAxis != null;

  static ChartDataStruct fromMap(Map<String, dynamic> data) => ChartDataStruct(
        yAxis: getDataList(data['yAxis']),
        xAxis: getDataList(data['xAxis']),
      );

  static ChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'yAxis': _yAxis,
        'xAxis': _xAxis,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'yAxis': serializeParam(
          _yAxis,
          ParamType.double,
          isList: true,
        ),
        'xAxis': serializeParam(
          _xAxis,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static ChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChartDataStruct(
        yAxis: deserializeParam<double>(
          data['yAxis'],
          ParamType.double,
          true,
        ),
        xAxis: deserializeParam<int>(
          data['xAxis'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'ChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChartDataStruct &&
        listEquality.equals(yAxis, other.yAxis) &&
        listEquality.equals(xAxis, other.xAxis);
  }

  @override
  int get hashCode => const ListEquality().hash([yAxis, xAxis]);
}

ChartDataStruct createChartDataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChartDataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChartDataStruct? updateChartDataStruct(
  ChartDataStruct? chartData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chartData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChartDataStructData(
  Map<String, dynamic> firestoreData,
  ChartDataStruct? chartData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chartData == null) {
    return;
  }
  if (chartData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chartData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chartDataData = getChartDataFirestoreData(chartData, forFieldValue);
  final nestedData = chartDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chartData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChartDataFirestoreData(
  ChartDataStruct? chartData, [
  bool forFieldValue = false,
]) {
  if (chartData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chartData.toMap());

  // Add any Firestore field values
  chartData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChartDataListFirestoreData(
  List<ChartDataStruct>? chartDatas,
) =>
    chartDatas?.map((e) => getChartDataFirestoreData(e, true)).toList() ?? [];
