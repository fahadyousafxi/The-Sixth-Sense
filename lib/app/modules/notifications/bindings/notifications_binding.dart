/*
 * File name: notifications_binding.dart
 * Last modified: 2022.12.12
 * Author: Ditlou tsa Molongoana
 * App Name: The sixth sense
 * Copyright (c) 2022
 */

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
  }
}
