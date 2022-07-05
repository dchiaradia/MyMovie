import 'dart:convert';

class Trailer {
  String? iso_639_1;
  String? iso_3166_1;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? published_at;
  String? id;
  Trailer({
    this.iso_639_1,
    this.iso_3166_1,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.published_at,
    this.id,
  });

  Trailer copyWith({
    String? iso_639_1,
    String? iso_3166_1,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? published_at,
    String? id,
  }) {
    return Trailer(
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      published_at: published_at ?? this.published_at,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iso_639_1': iso_639_1,
      'iso_3166_1': iso_3166_1,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': published_at,
      'id': id,
    };
  }

  factory Trailer.fromMap(Map<String, dynamic> map) {
    return Trailer(
      iso_639_1: map['iso_639_1'],
      iso_3166_1: map['iso_3166_1'],
      name: map['name'],
      key: map['key'],
      site: map['site'],
      size: map['size']?.toInt(),
      type: map['type'],
      official: map['official'],
      published_at: map['published_at'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Trailer.fromJson(String source) =>
      Trailer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Trailer(iso_639_1: $iso_639_1, iso_3166_1: $iso_3166_1, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, published_at: $published_at, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trailer &&
        other.iso_639_1 == iso_639_1 &&
        other.iso_3166_1 == iso_3166_1 &&
        other.name == name &&
        other.key == key &&
        other.site == site &&
        other.size == size &&
        other.type == type &&
        other.official == official &&
        other.published_at == published_at &&
        other.id == id;
  }

  @override
  int get hashCode {
    return iso_639_1.hashCode ^
        iso_3166_1.hashCode ^
        name.hashCode ^
        key.hashCode ^
        site.hashCode ^
        size.hashCode ^
        type.hashCode ^
        official.hashCode ^
        published_at.hashCode ^
        id.hashCode;
  }
}
