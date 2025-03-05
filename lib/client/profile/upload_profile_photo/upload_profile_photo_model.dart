import '/flutter_flow/flutter_flow_util.dart';
import 'upload_profile_photo_widget.dart' show UploadProfilePhotoWidget;
import 'package:flutter/material.dart';

class UploadProfilePhotoModel
    extends FlutterFlowModel<UploadProfilePhotoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
