import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/privacy_controller.dart';

class TermsAndCondition extends GetView<PrivacyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Terms And Condition".tr,
            style: Get.textTheme.headline6,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => {Get.back()},
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: WebView(
            // initialUrl: "${Get.find<GlobalService>().baseUrl}privacy/index.html",
            initialUrl: "https://docs.google.com/document/d/1rhpu8_fYsJ-0TQsXHFFzsjOJn6OkYpwF-XT7_JFzCD4/edit?usp=sharing",
            // javascriptMode: JavascriptMode.unrestricted
          ),
        ));
  }
}
