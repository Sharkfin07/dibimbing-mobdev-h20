// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProvinceNotifier)
const provinceProvider = ProvinceNotifierProvider._();

final class ProvinceNotifierProvider
    extends $NotifierProvider<ProvinceNotifier, ProvinceState> {
  const ProvinceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'provinceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$provinceNotifierHash();

  @$internal
  @override
  ProvinceNotifier create() => ProvinceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProvinceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProvinceState>(value),
    );
  }
}

String _$provinceNotifierHash() => r'0c80165b7cd15298021535f17722992ae3f65ed5';

abstract class _$ProvinceNotifier extends $Notifier<ProvinceState> {
  ProvinceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProvinceState, ProvinceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProvinceState, ProvinceState>,
              ProvinceState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
