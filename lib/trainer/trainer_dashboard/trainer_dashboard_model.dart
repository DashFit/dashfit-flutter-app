import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trainer_dashboard_widget.dart' show TrainerDashboardWidget;
import 'package:flutter/material.dart';

class TrainerDashboardModel extends FlutterFlowModel<TrainerDashboardWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedUserDetails;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in TrainerDashboard widget.
  GoersDataRecord? firstSelectedUsersData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
