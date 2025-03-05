import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_score_list_model.dart';
export 'empty_score_list_model.dart';

class EmptyScoreListWidget extends StatefulWidget {
  const EmptyScoreListWidget({super.key});

  @override
  State<EmptyScoreListWidget> createState() => _EmptyScoreListWidgetState();
}

class _EmptyScoreListWidgetState extends State<EmptyScoreListWidget> {
  late EmptyScoreListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyScoreListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
              child: Text(
                'No Sets added yet',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 16.0,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
