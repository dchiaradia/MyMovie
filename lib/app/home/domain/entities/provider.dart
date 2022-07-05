import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movie2/app/home/domain/entities/provider_item.dart';

class Provider {
  String? link;
  List<ProviderItem>? buy;
  List<ProviderItem>? flatrate;
  List<ProviderItem>? rent;
  Provider({
    this.link,
    this.buy,
    this.flatrate,
    this.rent,
  });

  Provider copyWith({
    String? link,
    List<ProviderItem>? buy,
    List<ProviderItem>? flatrate,
    List<ProviderItem>? rent,
  }) {
    return Provider(
      link: link ?? this.link,
      buy: buy ?? this.buy,
      flatrate: flatrate ?? this.flatrate,
      rent: rent ?? this.rent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'buy': buy?.map((x) => x.toMap()).toList(),
      'flatrate': flatrate?.map((x) => x.toMap()).toList(),
      'rent': rent?.map((x) => x.toMap()).toList(),
    };
  }

  factory Provider.fromMap(Map<String, dynamic> map) {
    return Provider(
      link: map['link'],
      buy: map['buy'] != null
          ? List<ProviderItem>.from(
              map['buy']?.map((x) => ProviderItem.fromMap(x)))
          : null,
      flatrate: map['flatrate'] != null
          ? List<ProviderItem>.from(
              map['flatrate']?.map((x) => ProviderItem.fromMap(x)))
          : null,
      rent: map['rent'] != null
          ? List<ProviderItem>.from(
              map['rent']?.map((x) => ProviderItem.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Provider.fromJson(String source) =>
      Provider.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Provider(link: $link, buy: $buy, flatrate: $flatrate, rent: $rent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Provider &&
        other.link == link &&
        listEquals(other.buy, buy) &&
        listEquals(other.flatrate, flatrate) &&
        listEquals(other.rent, rent);
  }

  @override
  int get hashCode {
    return link.hashCode ^ buy.hashCode ^ flatrate.hashCode ^ rent.hashCode;
  }
}
