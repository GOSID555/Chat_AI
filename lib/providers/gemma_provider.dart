// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_gemma/flutter_gemma.dart';

// // final gemmaProvider = Provider<Gemma>((ref) {
// //   return Gemma(model: GemmaModel.gemma2BItGpuInt4);
// // });

// final responseProvider = FutureProvider.family<String, String>((
//   ref,
//   prompt,
// ) async {
//   final gemma = ref.read(gemmaProvider);
//   await gemma.loadAssetModel(fullPath: 'assets/models/model.bin');
//   await gemma.init(maxTokens: 2048, temperature: 0.7);

//   final result = await gemma.generate(prompt);
//   return result.text;
// });
