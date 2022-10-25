import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quietpaper/data/respositorydataProvider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quietpaper'),
      ),
      body: Center(
        child: data.when(
          data: (data) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var dataValue = data[index];
                  return Container(
                    width: dataValue.width.toDouble(),
                    height: dataValue.height.toDouble(),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(dataValue.url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                });
          },
          error: ((error, stackTrace) => Center(
                child: Text(
                  error.toString(),
                ),
              )),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
