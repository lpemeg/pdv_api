import 'package:flutter/material.dart';

class RodapeView extends StatelessWidget {
  const RodapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 20,
      child: const Center(
        child: Text(
          'Versão 1.0.0',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
