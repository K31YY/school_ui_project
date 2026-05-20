// import 'package:get/get.dart';

// enum RouteView { dashboard, home }

// extension ActionRouteView on RouteView {
//   // Use: RouteView.home.go()
//   Future<void> go({
//     bool replacment = false,
//     bool clearAll = false,
//     dynamic arguments,
//     int? id,
//     Map<String, String>? parameters,
//   }) async {
//     if (clearAll) {
//       return Get.offAllNamed(
//         '/$name',
//         // predicate: (route) => false,
//         arguments: arguments,
//         id: id,
//         parameters: parameters,
//       );
//     } else if (replacment) {
//       return Get.offAndToNamed(
//         '/$name',
//         arguments: arguments,
//         id: id,
//         parameters: parameters,
//       );
//     } else {
//       return Get.toNamed(
//         '/$name',
//         arguments: arguments,
//         id: id,
//         parameters: parameters,
//       );
//     }
//   }
// }

// class AppRouting {
//   static final route =
//       RouteView.values.map((e) {
//         switch (e) {
//           case RouteView.dashboard:
//             return GetPage(
//               name: "/",
//               page: () => DashboardController(),
//               transition: Transition.noTransition,
//             );
//           case RouteView.home:
//             return GetPage(
//               name: "/${e.name}",
//               page: () => HomeController(),
//               transition: Transition.noTransition,
//             );
//         }
//       }).toList();
// }
