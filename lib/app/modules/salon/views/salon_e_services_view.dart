/*
 * File name: salon_e_services_view.dart
 * Last modified: 2022.12.12
 * Author: Ditlou tsa Molongoana
 * App Name: The sixth sense
 * Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/salon_e_services_controller.dart';
import '../widgets/services_list_widget.dart';

class SalonEServicesView extends GetView<SalonEServicesController> {
  @override
  Widget build(BuildContext context) {
    return ServicesListWidget();
  }
}
