import 'package:flutter/material.dart';

class ProcessIndicator extends StatefulWidget {
  const ProcessIndicator({super.key});

  @override
  State<ProcessIndicator> createState() => _ProcessIndicatorState();
}

class _ProcessIndicatorState extends State<ProcessIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      decoration: const BoxDecoration(),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
