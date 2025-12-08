import 'package:d20_state_management/provider/province_provider.dart';
import 'package:d20_state_management/widgets/province/province_item.dart';
import 'package:d20_state_management/widgets/province/province_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProvincePage extends ConsumerStatefulWidget {
  const ProvincePage({super.key});

  @override
  ConsumerState<ProvincePage> createState() => _ProvincePageState();
}

class _ProvincePageState extends ConsumerState<ProvincePage> {
  @override
  void initState() {
    super.initState();
    // Using ref from ConsumerState to trigger fetch after widget is mounted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(provinceProvider.notifier).getProvinces();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provinceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Indonesia's Provinces")),
      body: Center(
        child: state.isLoading
            ? const ProvinceLoader()
            : state.provinces.isEmpty
            ? const Center(child: Text("No provinces found"))
            : ListView.builder(
                itemCount: state.provinces.length,
                itemBuilder: (context, index) =>
                    ProvinceItem(province: state.provinces[index]),
              ),
      ),
    );
  }
}
