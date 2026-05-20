import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class MainResponsive extends StatelessWidget {
  final Widget? small;
  final Widget? medium;
  final Widget? large;

  const MainResponsive({
    super.key,
    this.small,
    this.medium,
    this.large,
  });

  /// mobile < 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  /// tablet >= 650
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  ///desktop >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return large ?? const SizedBox();
      } else if (constraints.maxWidth >= 650) {
        return medium ?? const SizedBox();
      } else {
        return small ?? const SizedBox();
      }
    });
  }
}



// class MainResponsive extends StatefulWidget {
//   final Widget? small;
//   final Widget? medium;
//   final Widget? large;
//   final Widget? watchSmall;

//   const MainResponsive({
//     this.small,
//     this.medium,
//     this.large,
//     this.watchSmall,
//     super.key,
//   });

//   @override
//   State<MainResponsive> createState() => _MainResponsiveState();
// }

// class _MainResponsiveState extends State<MainResponsive> {
//   @override
//   Widget build(BuildContext context) {
//     // Get the current screen size
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Define breakpoints for responsiveness
//     if (screenWidth < 300) {
//       // Watch size
//       return widget.watchSmall ?? const SizedBox();
//     } else if (screenWidth < 600) {
//       // Phone size
//       return widget.small ?? const SizedBox();
//     } else if (screenWidth < 1200) {
//       // Tablet size
//       return widget.medium ?? const SizedBox();
//     } else {
//       // Desktop size
//       return widget.large ?? const SizedBox();
//     }
//   }
// }

// class MainResponsive extends GetResponsiveView {
//   final Widget? small;
//   final Widget? medium;
//   final Widget? large;
//   final Widget? watchSmall;

//   MainResponsive({
//     this.small,
//     this.medium,
//     this.large,
//     this.watchSmall,
//     super.key,
//   });

//   @override
//   Widget? phone() {
//     return small;
//   }

//   @override
//   Widget? tablet() {
//     return medium;
//   }

//   @override
//   Widget? desktop() {
//     return large;
//   }

//   @override
//   Widget? watch() {
//     return watchSmall;
//   }
// }
