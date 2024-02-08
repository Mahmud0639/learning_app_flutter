// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseDetailsControllerHash() =>
    r'807653477780766d12fe433c225bdcf3b17c488e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [courseDetailsController].
@ProviderFor(courseDetailsController)
const courseDetailsControllerProvider = CourseDetailsControllerFamily();

/// See also [courseDetailsController].
class CourseDetailsControllerFamily extends Family<AsyncValue<CourseItem?>> {
  /// See also [courseDetailsController].
  const CourseDetailsControllerFamily();

  /// See also [courseDetailsController].
  CourseDetailsControllerProvider call({
    required int index,
  }) {
    return CourseDetailsControllerProvider(
      index: index,
    );
  }

  @override
  CourseDetailsControllerProvider getProviderOverride(
    covariant CourseDetailsControllerProvider provider,
  ) {
    return call(
      index: provider.index,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'courseDetailsControllerProvider';
}

/// See also [courseDetailsController].
class CourseDetailsControllerProvider
    extends AutoDisposeFutureProvider<CourseItem?> {
  /// See also [courseDetailsController].
  CourseDetailsControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => courseDetailsController(
            ref as CourseDetailsControllerRef,
            index: index,
          ),
          from: courseDetailsControllerProvider,
          name: r'courseDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseDetailsControllerHash,
          dependencies: CourseDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseDetailsControllerFamily._allTransitiveDependencies,
          index: index,
        );

  CourseDetailsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<CourseItem?> Function(CourseDetailsControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseDetailsControllerProvider._internal(
        (ref) => create(ref as CourseDetailsControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CourseItem?> createElement() {
    return _CourseDetailsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseDetailsControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CourseDetailsControllerRef on AutoDisposeFutureProviderRef<CourseItem?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _CourseDetailsControllerProviderElement
    extends AutoDisposeFutureProviderElement<CourseItem?>
    with CourseDetailsControllerRef {
  _CourseDetailsControllerProviderElement(super.provider);

  @override
  int get index => (origin as CourseDetailsControllerProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
