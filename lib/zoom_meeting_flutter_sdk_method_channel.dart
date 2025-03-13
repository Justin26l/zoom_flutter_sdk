import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zoom_meeting_flutter_sdk_platform_interface.dart';

/// An implementation of [ZoomMeetingFlutterSdkPlatform] that uses method channels.
class MethodChannelZoomMeetingFlutterSdk extends ZoomMetingFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zoom_meeting_flutter_sdk');

  @override
  Future<bool?> initZoom({
    required String jwtToken
  }) async {
    final version = await methodChannel.invokeMethod<bool>(
      'initZoom',
      {
        "jwtToken": jwtToken,
      },
    );
    return version;
  }

  @override
  Future<bool?> joinMeting({
    required String meetingNumber,
    required String meetingPassword,
    required String displayName,
  }) async {
    final version = await methodChannel.invokeMethod<bool>(
      'joinMeeting',
      {
        "meetingNumber": meetingNumber,
        "meetingPassword": meetingPassword,
        "displayName": displayName
      },
    );
    debugPrint("MethodChannelZoomNatively-joinMeting -> $version");
    return version;
  }
}
