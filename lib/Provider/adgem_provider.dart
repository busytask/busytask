import 'package:cash_rocket/Repositories/ad_gem_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/adgem_model.dart';

AdGemRepo _adGemRepo = AdGemRepo();

final adGemProvider = FutureProvider<AdgemModel>((ref) async {
  return _adGemRepo.getadGem();
});
