import 'package:cash_rocket/Model/wannads_model.dart';
import 'package:cash_rocket/Repositories/wannads_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

WannadsRepo _wannadsRepo = WannadsRepo();

final wannadsProvider = FutureProvider<List<WannadsModel>>((ref) async {
  return _wannadsRepo.getWannads();
});
