import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'upload_profile_photo_model.dart';
export 'upload_profile_photo_model.dart';

class UploadProfilePhotoWidget extends StatefulWidget {
  const UploadProfilePhotoWidget({super.key});

  @override
  State<UploadProfilePhotoWidget> createState() =>
      _UploadProfilePhotoWidgetState();
}

class _UploadProfilePhotoWidgetState extends State<UploadProfilePhotoWidget> {
  late UploadProfilePhotoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadProfilePhotoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UploadProfilePhoto'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('UPLOAD_PROFILE_PHOTO_Icon_x6ppogy5_ON_TA');
                  logFirebaseEvent('Icon_navigate_back');
                  context.safePop();
                },
                child: const Icon(
                  Icons.keyboard_backspace,
                  color: Color(0xFF40B1BF),
                  size: 24.0,
                ),
              ),
              Text(
                'Upload Profile Photo',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(const SizedBox(width: 10.0)),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFF6FC177),
                            shape: BoxShape.circle,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (currentUserPhoto != '') {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.network(
                                    currentUserPhoto,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                  ),
                                );
                              } else {
                                return Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      functions.convertToTitleCase(
                                          currentUserDisplayName),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 44.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'UPLOAD_PROFILE_PHOTO_Container_pcgkvsnt_');
                                if (currentUserPhoto != '') {
                                  logFirebaseEvent('Container_delete_data');
                                  await FirebaseStorage.instance
                                      .refFromURL(currentUserPhoto)
                                      .delete();
                                }
                                logFirebaseEvent(
                                    'Container_upload_media_to_firebase');
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(
                                      () => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    safeSetState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                // Update user reference
                                logFirebaseEvent(
                                    'Container_Updateuserreference');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  photoUrl: _model.uploadedFileUrl,
                                ));
                                // Update user data reference
                                logFirebaseEvent(
                                    'Container_Updateuserdatareference');

                                await currentUserDocument!.userDataReference!
                                    .update(createUsersDataRecordData(
                                  photoUrl: _model.uploadedFileUrl,
                                ));
                                logFirebaseEvent('Container_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Profile photo uploaded!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE6F7FC),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Color(0xFF40B1BF),
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Choose Photo',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'UPLOAD_PROFILE_PHOTO_Container_15fmzb6w_');
                              logFirebaseEvent('Container_delete_data');
                              await FirebaseStorage.instance
                                  .refFromURL(currentUserPhoto)
                                  .delete();
                              logFirebaseEvent('Container_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                photoUrl: '',
                              ));
                              logFirebaseEvent('Container_backend_call');

                              await currentUserDocument!.userDataReference!
                                  .update(createUsersDataRecordData(
                                photoUrl: '',
                              ));
                              logFirebaseEvent('Container_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Profile photo removed successfully',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE6F7FC),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Icon(
                                      Icons.delete_outline,
                                      color: Color(0xFFD42B31),
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Delete Photo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: const Color(0xFFF80505),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 15.0)),
                      ),
                    ),
                  ].divide(const SizedBox(height: 20.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
