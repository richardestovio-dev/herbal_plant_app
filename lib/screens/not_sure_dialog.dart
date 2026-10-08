import 'package:flutter/material.dart';

import '../services/herbvision_onnx_service.dart';

Future<void> showNotSureDialog(
  BuildContext context,
  HerbVisionPrediction prediction,
) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Low Confidence'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HerbVision could not identify this plant '
              'with high confidence.',
            ),

            const SizedBox(height: 16),

            Text(
              'Closest prediction: ${prediction.plantName}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 6),

            Text(
              'Confidence: '
              '${(prediction.confidence * 100).toStringAsFixed(2)}%',
            ),

            const SizedBox(height: 16),

            const Text(
              'For better results, try again with a clear '
              'photo of a single leaf or plant in good '
              'lighting.',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
