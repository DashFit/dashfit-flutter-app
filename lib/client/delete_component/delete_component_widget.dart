import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'delete_component_model.dart';
export 'delete_component_model.dart';

class DeleteComponentWidget extends StatefulWidget {
  const DeleteComponentWidget({super.key});

  @override
  State<DeleteComponentWidget> createState() => _DeleteComponentWidgetState();
}

class _DeleteComponentWidgetState extends State<DeleteComponentWidget> {
  late DeleteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delete this entry?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DELETE_COMPONENT_Icon_t96xtn5m_ON_TAP');
                      logFirebaseEvent('Icon_close_dialog_drawer_etc');
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF0098AD),
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Text(
                'Are you sure you want to delete \nthis entry?',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 15.0,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('DELETE_COMPONENT_COMP_CANCEL_BTN_ON_TAP');
                    logFirebaseEvent('Button_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFE6F7FC),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    borderSide: const BorderSide(
                      color: Color(0xFFC3EEFC),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('DELETE_COMPONENT_YES_DELETE_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');
                    await FFAppState().userDataReference!.delete();
                  },
                  text: 'Yes, Delete',
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFF80505),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Manrope',
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(const SizedBox(width: 10.0)),
            ),
          ].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
