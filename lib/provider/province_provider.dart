import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:d20_state_management/data/models/province_response.dart';
import 'package:d20_state_management/data/repositories/province_repository.dart';

part 'province_provider.g.dart';

/// Simple immutable state to hold provinces and loading flag.
class ProvinceState {
  final List<ProvinceResponse> provinces;
  final bool isLoading;

  const ProvinceState({this.provinces = const [], this.isLoading = false});

  ProvinceState copyWith({List<ProvinceResponse>? provinces, bool? isLoading}) {
    return ProvinceState(
      provinces: provinces ?? this.provinces,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class ProvinceNotifier extends _$ProvinceNotifier {
  final ProvinceRepository _repository = ProvinceRepository();

  @override
  ProvinceState build() {
    return const ProvinceState();
  }

  Future<void> getProvinces() async {
    state = state.copyWith(isLoading: true);
    try {
      final data = await _repository.getProvinces();
      state = state.copyWith(provinces: data);
    } catch (e) {
      state = state.copyWith(provinces: []);
      if (!const bool.fromEnvironment('dart.vm.product')) {
        // ignore: avoid_print
        print('Error fetching provinces: $e');
      }
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
