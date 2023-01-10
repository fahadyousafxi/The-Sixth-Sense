/*
 * File name: paymongo_controller.dart
 * Last modified: 2022.12.12
 * Author: Ditlou tsa Molongoana
 * App Name: The sixth sense
 * Copyright (c) 2022
 */

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../common/helper.dart';
import '../../../models/booking_model.dart';
import '../../../repositories/payment_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/global_service.dart';
import '../../bookings/controllers/bookings_controller.dart';
import '../../global_widgets/tab_bar_widget.dart';

class PayMongoController extends GetxController {
  WebViewController webView;
  PaymentRepository _paymentRepository;
  final url = "".obs;
  final progress = 0.0.obs;
  final booking = new Booking().obs;

  PayMongoController() {
    _paymentRepository = new PaymentRepository();
  }

  @override
  void onInit() {
    booking.value = Get.arguments['booking'] as Booking;
    getUrl();
    super.onInit();
  }

  void getUrl() {
    url.value = _paymentRepository.getPayMongoUrl(booking.value);
  }

  void showConfirmationIfSuccess() {
    final _doneUrl = "${Helper.toUrl(Get.find<GlobalService>().baseUrl)}payments/paymongo";
    if (url == _doneUrl) {
      Get.find<BookingsController>().currentStatus.value = Get.find<BookingsController>().getStatusByOrder(1).id;
      if (Get.isRegistered<TabBarController>(tag: 'bookings')) {
        Get.find<TabBarController>(tag: 'bookings').selectedId.value = Get.find<BookingsController>().getStatusByOrder(1).id;
      }
      Get.toNamed(Routes.CONFIRMATION, arguments: {
        'title': "Payment Successful".tr,
        'long_message': "Your Payment is Successful".tr,
      });
    }
  }
}
