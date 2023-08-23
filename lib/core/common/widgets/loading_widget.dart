import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  const LoadingWidget({
    super.key,
    this.width = 100,
    this.height = 140,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 8),
      width: 100,
      height: 140,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: child ??
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 1,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
