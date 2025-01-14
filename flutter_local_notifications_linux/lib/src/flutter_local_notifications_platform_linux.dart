import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';

import 'model/capabilities.dart';
import 'model/initialization_settings.dart';
import 'model/notification_details.dart';

export 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';

/// The interface that all implementations of flutter_local_notifications_linux
/// must implement.
abstract class FlutterLocalNotificationsPlatformLinux
    extends FlutterLocalNotificationsPlatform {
  /// Initializes the plugin.
  ///
  /// Call this method on application before using the plugin further.
  /// This should only be done once. When a notification created by this plugin
  /// was used to launch the app, calling `initialize` is what will trigger to
  /// the `onSelectNotification` callback to be fire.
  Future<bool?> initialize(
    LinuxInitializationSettings initializationSettings, {
    SelectNotificationCallback? onSelectNotification,
  });

  /// Show a notification with an optional payload that will be passed back to
  /// the app when a notification is tapped on.
  @override
  Future<void> show(
    int id,
    String? title,
    String? body, {
    LinuxNotificationDetails? notificationDetails,
    String? payload,
  });

  /// Returns the system notification server capabilities.
  /// Some functionality may not be implemented by the notification server,
  /// conforming clients should check if it is available before using it.
  Future<LinuxServerCapabilities> getCapabilities();

  /// Returns a [Map] with the specified notification id as the key
  /// and the id, assigned by the system, as the value.
  ///
  /// Note: the system ID is unique only within the current user session,
  /// so it's undesirable to save it to persistable storage without any
  /// invalidation/update. For more information, please see
  /// Desktop Notifications Specification https://developer.gnome.org/notification-spec/#basic-design
  Future<Map<int, int>> getSystemIdMap();
}
