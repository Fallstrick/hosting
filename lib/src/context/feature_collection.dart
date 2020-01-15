/// [FeatureCollection] used to collect [HttpRequest] and [HttpResponse]
class FeatureCollection {
  final Map<Type, Object> _features = {};
}

/// Extension method to get and set the [FeatureCollection]
extension FeatureCollectionExtension on FeatureCollection {
// ignore: always_declare_return_types
  get<T>() {
    try {
      return _features[T];
    } catch (e) {
      return null;
    }
  }

// ignore: always_declare_return_types
 void set<T>(T feature){
    _features[T] = feature;
  }
}
