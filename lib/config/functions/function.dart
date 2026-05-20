import 'package:flutter/material.dart';
import 'package:flutter_first_project/widget/button_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/theme_style.dart';

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
    for (int i = 0; i < length; i++) ...[
      if (i > 0) SizedBox(width: width, height: height),
      this[i],
    ],
  ];
}

void notificationAlert(String message) {
  Get.rawSnackbar(
    padding: const EdgeInsets.only(left: 28, top: 12, bottom: 10),
    messageText: Text(
      message,
      style: AppTextStyle.regular16(color: Colors.white),
    ),
    isDismissible: false,
    duration: const Duration(seconds: 3),
    backgroundColor: AppColors.redColor,
    icon: Container(
      alignment: Alignment.topRight,
      height: 18,
      width: 68,
      child: const Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
        size: 18,
      ),
    ),
    margin: EdgeInsets.zero,
    snackStyle: SnackStyle.GROUNDED,
  );
}

void processAlert({required String message, required void Function() onTap}) {
  Get.dialog(
    barrierDismissible: false,
    LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        bool isPortrait = screenHeight > screenWidth;

        // Calculate margins, padding, and constraints based on orientation and screen size
        double margin = screenWidth * 0.05;
        double padding =
            screenWidth *
            (isPortrait ? 0.05 : 0.02); // Smaller padding in landscape
        double maxWidth = isPortrait ? screenWidth * 0.9 : screenWidth * 0.6;
        double maxHeight = isPortrait ? screenHeight * 0.4 : screenHeight * 0.5;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: margin),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/icons/file.gif', scale: 7),
                    Text(
                      'inProgress'.tr,
                      style: AppTextStyle.bold18(color: AppTheme.primarySwatch),
                    ),
                    Text(
                      message,
                      style: AppTextStyle.regular15(
                        color: AppTheme.primarySwatch,
                      ),
                    ),
                    const SizedBox(),
                    ButtonWidget(title: 'cancel'.tr, onTap: onTap),
                  ].withSpaceBetween(height: 10),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

void sucessfullyAlert({
  required String message,
  required void Function() onTap,
}) {
  Get.dialog(
    barrierDismissible: false,
    LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        bool isPortrait = screenHeight > screenWidth;

        // Calculate margins, padding, and constraints based on orientation and screen size
        double margin = screenWidth * 0.05;
        double padding =
            screenWidth *
            (isPortrait ? 0.05 : 0.02); // Smaller padding in landscape
        double maxWidth = isPortrait ? screenWidth * 0.9 : screenWidth * 0.6;
        double maxHeight = isPortrait ? screenHeight * 0.4 : screenHeight * 0.5;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: margin),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/icons/Animation - 1720670629863.gif',
                      scale: 2,
                    ),
                    Text(
                      'confirm'.tr,
                      style: AppTextStyle.bold18(color: AppTheme.primarySwatch),
                    ),
                    Text(
                      message,
                      style: AppTextStyle.regular15(
                        color: AppTheme.primarySwatch,
                      ),
                    ),
                    const SizedBox(),
                    ButtonWidget(title: 'ok'.tr, onTap: onTap),
                  ].withSpaceBetween(height: 10),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

void waitAlert({
  required String message,
  void Function()? onTap,
  void Function()? onTapCancel,
}) {
  Get.dialog(
    barrierDismissible: false,
    LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        bool isPortrait = screenHeight > screenWidth;

        // Calculate margins, padding, and constraints based on orientation and screen size
        double margin = screenWidth * 0.05;
        double padding =
            screenWidth *
            (isPortrait ? 0.05 : 0.02); // Smaller padding in landscape
        double maxWidth = isPortrait ? screenWidth * 0.9 : screenWidth * 0.6;
        double maxHeight = isPortrait ? screenHeight * 0.4 : screenHeight * 0.5;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: margin),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/icons/question.png',
                      scale: 6,
                      color: AppTheme.primarySwatch,
                    ),
                    Text(
                      'confirm'.tr,
                      style: AppTextStyle.bold18(color: AppTheme.primarySwatch),
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular14(
                        color: AppTheme.primarySwatch,
                      ),
                    ),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (onTapCancel != null)
                          Expanded(
                            child: ButtonWidget(
                              title: 'cancel'.tr,
                              onTap: onTapCancel,
                              outline: true,
                            ),
                          ),
                        if (onTap != null)
                          Expanded(
                            child: ButtonWidget(title: 'ok'.tr, onTap: onTap),
                          ),
                      ].withSpaceBetween(width: 15),
                    ),
                  ].withSpaceBetween(height: 10),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

void askAlert({
  required String message,
  void Function()? onTap,
  void Function()? onTapCancel,
}) {
  Get.dialog(
    barrierDismissible: false,
    LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        bool isPortrait = screenHeight > screenWidth;

        // Calculate margins, padding, and constraints based on orientation and screen size
        double margin = screenWidth * 0.05;
        double padding =
            screenWidth *
            (isPortrait ? 0.05 : 0.02); // Smaller padding in landscape
        double maxWidth = isPortrait ? screenWidth * 0.9 : screenWidth * 0.6;
        double maxHeight = isPortrait ? screenHeight * 0.4 : screenHeight * 0.5;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: margin),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/icons/question.png',
                      scale: 7,
                      color: AppTheme.primarySwatch,
                    ),
                    Text(
                      'confirm'.tr,
                      style: AppTextStyle.bold18(color: AppTheme.primarySwatch),
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular14(
                        color: AppTheme.primarySwatch,
                      ),
                    ),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (onTapCancel != null)
                          Expanded(
                            child: ButtonWidget(
                              title: 'cancel'.tr,
                              onTap: onTapCancel,
                              outline: true,
                            ),
                          ),
                        if (onTap != null)
                          Expanded(
                            child: ButtonWidget(title: 'ok'.tr, onTap: onTap),
                          ),
                      ].withSpaceBetween(width: 15),
                    ),
                  ].withSpaceBetween(height: 10),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

void errorAlert({
  required String message,
  void Function()? onTap,
  void Function()? onTapCancel,
  int? delayDuration,
}) {
  Get.dialog(
    barrierDismissible: false,
    LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        bool isPortrait = screenHeight > screenWidth;

        // Calculate margins, padding, and constraints based on orientation and screen size
        double margin = screenWidth * 0.05;
        double padding =
            screenWidth *
            (isPortrait ? 0.05 : 0.02); // Smaller padding in landscape
        double maxWidth = isPortrait ? screenWidth * 0.9 : screenWidth * 0.6;
        double maxHeight = isPortrait ? screenHeight * 0.4 : screenHeight * 0.5;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: margin),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/error.png',
                          scale: 12,
                          color: AppColors.redColor,
                        ),
                        Text(
                          'Error',
                          style: AppTextStyle.bold18(color: AppColors.redColor),
                        ),
                        Text(
                          message,
                          style: AppTextStyle.regular15(
                            color: AppTheme.primarySwatch,
                          ),
                        ),
                        const SizedBox(),
                        delayDuration == null
                            ? Row(
                              children: [
                                if (onTapCancel != null)
                                  Expanded(
                                    child: ButtonWidget(
                                      title: 'cancel'.tr,
                                      onTap: onTapCancel,
                                      outline: true,
                                      backgroundColor: AppColors.redColor,
                                    ),
                                  ),
                                if (onTap != null)
                                  Expanded(
                                    child: ButtonWidget(
                                      title: 'ok'.tr,
                                      onTap: onTap,
                                      backgroundColor: AppColors.redColor,
                                    ),
                                  ),
                              ].withSpaceBetween(width: 15),
                            )
                            : Row(
                              children: [
                                if (onTapCancel != null)
                                  Expanded(
                                    child: ButtonWidget(
                                      title: 'cancel'.tr,
                                      onTap: onTapCancel,
                                      outline: true,
                                      backgroundColor: AppColors.redColor,
                                    ),
                                  ),
                                if (onTap != null)
                                  Expanded(
                                    child: ButtonWidget(
                                      title: 'ok'.tr,
                                      onTap: onTap,
                                      backgroundColor: AppColors.redColor,
                                      delayDuration: delayDuration,
                                    ),
                                  ),
                              ].withSpaceBetween(width: 15),
                            ),
                      ].withSpaceBetween(height: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
  // Future.delayed(const Duration(seconds: 3), () {
  //   Get.back();
  // });
}

String convertDateFormat(String dateInput) {
  try {
    DateTime dateTime = DateTime.parse(dateInput);

    DateFormat outputFormat = DateFormat('dd/MM/yyyy');

    String outputDate = outputFormat.format(dateTime);

    return outputDate;
  } catch (e) {
    debugPrint("Error parsing date: $e");
    return "";
  }
}

Widget shimmarLoading() {
  return Container(
    constraints: const BoxConstraints(minHeight: 260),
    padding: const EdgeInsets.only(left: 28, right: 28, top: 10, bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3)],
    ),
    child: Column(
      children: List.generate(
        4,
        (index) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: AppTheme.primarySwatch.shade200,
              highlightColor: AppColors.blur,
              enabled: true,
              child: Container(
                margin: EdgeInsets.only(
                  right:
                      index == 1
                          ? 200
                          : index == 2
                          ? 350
                          : index == 3
                          ? 450
                          : 0,
                ),
                height: 15,
                color: AppColors.blur,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}

Widget shimmarLoadings() {
  return Container(
    padding: const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3)],
    ),
    child: Column(
      children: List.generate(
        4,
        (index) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Shimmer.fromColors(
              baseColor: AppTheme.primarySwatch.shade100,
              highlightColor: AppColors.blur,
              enabled: true,
              child: Container(
                margin: EdgeInsets.only(
                  right:
                      index == 1
                          ? 150
                          : index == 2
                          ? 200
                          : index == 3
                          ? 300
                          : 0,
                ),
                height: 12,
                color: AppColors.blur,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}

String calculateContractDuration(
  String contractStartDate,
  String contractEndDate,
) {
  // Convert the string dates to DateTime objects
  DateTime startDate = DateTime.parse(_convertDateFormat(contractStartDate));
  DateTime endDate = DateTime.parse(_convertDateFormat(contractEndDate));

  // Calculate the difference
  Duration difference = endDate.difference(startDate);

  // Get the difference in days, months, and years
  int days = difference.inDays;
  int years = days ~/ 365;
  int months = (days % 365) ~/ 30;
  days = (days % 365) % 30;

  return "$years years, $months months, $days days";
}

int calculateContractDurationTotalMonths(
  String? contractStartDate,
  String? contractEndDate,
) {
  // Check if either start or end date is null
  if (contractStartDate == '' || contractEndDate == '') {
    // throw ArgumentError("Both start date and end date must be provided.");
    return 0;
  }

  // Convert the string dates to DateTime objects
  DateTime startDate = DateTime.parse(_convertDateFormat(contractStartDate!));
  DateTime endDate = DateTime.parse(_convertDateFormat(contractEndDate!));

  // Calculate the total months difference
  int yearsDifference = endDate.year - startDate.year;
  int monthsDifference = endDate.month - startDate.month;

  // Total months is the difference in years converted to months plus the difference in months
  int totalMonths = yearsDifference * 12 + monthsDifference;

  return totalMonths;
}

// Helper function to convert date format from dd-MM-yyyy to yyyy-MM-dd
String _convertDateFormat(String date) {
  List<String> parts = date.split("/");
  return "${parts[2]}-${parts[1]}-${parts[0]}";
}

List<int> generateRange(int fromNum, int toNum) {
  return List<int>.generate(toNum - fromNum + 1, (index) => fromNum + index);
}

String formatDollar(String amount) {
  return NumberFormat.currency(
    symbol: "",
    decimalDigits: 2,
  ).format(double.parse(amount));
}
