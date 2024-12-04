import '/flutter_flow/flutter_flow_util.dart';
import 'client_upload_profile_photo_widget.dart'
    show ClientUploadProfilePhotoWidget;
import 'package:flutter/material.dart';

class ClientUploadProfilePhotoModel
    extends FlutterFlowModel<ClientUploadProfilePhotoWidget> {
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
