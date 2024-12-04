import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_client_list_model.dart';
export 'empty_client_list_model.dart';

class EmptyClientListWidget extends StatefulWidget {
  const EmptyClientListWidget({super.key});

  @override
  State<EmptyClientListWidget> createState() => _EmptyClientListWidgetState();
}

class _EmptyClientListWidgetState extends State<EmptyClientListWidget> {
  late EmptyClientListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyClientListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
            child: Text(
              'Lets start by adding your client\'s',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 16.0,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
