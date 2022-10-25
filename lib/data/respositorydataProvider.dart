import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quietpaper/models/models.dart';
import 'package:quietpaper/repository/repository.dart';

final dataProvider = FutureProvider<List<GetData>>((ref) async {
  return ref.watch(repositoryProvider).fetchData();
});
