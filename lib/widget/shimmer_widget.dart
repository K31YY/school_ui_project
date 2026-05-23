import 'package:flutter/material.dart';
import 'package:flutter_school_app/config/functions/function.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 3)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Icon(Icons.image, color: Colors.grey, size: 100),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(color: Colors.grey.shade200, height: 10),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(
                      margin: const EdgeInsets.only(right: 80),
                      color: Colors.grey.shade200,
                      height: 10,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(
                      margin: const EdgeInsets.only(right: 150),
                      color: Colors.grey.shade200,
                      height: 10,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(
                      margin: const EdgeInsets.only(right: 250),
                      color: Colors.grey.shade200,
                      height: 10,
                    ),
                  ),
                ].withSpaceBetween(height: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
