import 'dart:convert';

class ProviderItem {
  int? display_priority;
  String? logo_path;
  int? provider_id;
  String? provider_name;

  ProviderItem({
    this.display_priority,
    this.logo_path,
    this.provider_id,
    this.provider_name,
  });

  ProviderItem copyWith({
    int? display_priority,
    String? logo_path,
    int? provider_id,
    String? provider_name,
  }) {
    return ProviderItem(
      display_priority: display_priority ?? this.display_priority,
      logo_path: logo_path ?? this.logo_path,
      provider_id: provider_id ?? this.provider_id,
      provider_name: provider_name ?? this.provider_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'display_priority': display_priority,
      'logo_path': logo_path,
      'provider_id': provider_id,
      'provider_name': provider_name,
    };
  }

  factory ProviderItem.fromMap(Map<String, dynamic> map) {
    return ProviderItem(
      display_priority: map['display_priority']?.toInt(),
      logo_path: map['logo_path'],
      provider_id: map['provider_id']?.toInt(),
      provider_name: map['provider_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProviderItem.fromJson(String source) =>
      ProviderItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProviderItem(display_priority: $display_priority, logo_path: $logo_path, provider_id: $provider_id, provider_name: $provider_name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProviderItem &&
        other.display_priority == display_priority &&
        other.logo_path == logo_path &&
        other.provider_id == provider_id &&
        other.provider_name == provider_name;
  }

  @override
  int get hashCode {
    return display_priority.hashCode ^
        logo_path.hashCode ^
        provider_id.hashCode ^
        provider_name.hashCode;
  }
}
