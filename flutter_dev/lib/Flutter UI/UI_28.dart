import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({super.key});

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shimmer Effect")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(6, (index) => ShimmerLoadingItem()),
        ),
      ),
    );
  }
}

class ShimmerLoadingItem extends StatelessWidget {
  const ShimmerLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    
  }
}
