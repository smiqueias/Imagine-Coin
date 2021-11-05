class CoinModel {
  CoinModel({
    required this.pagination,
    required this.data,
  });
  late final Pagination pagination;
  late final List<Data> data;

  CoinModel.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromJson(json['pagination']);
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pagination'] = pagination.toJson();
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Pagination {
  Pagination({
    this.endingBefore,
    this.startingAfter,
    this.previousEndingBefore,
    required this.nextStartingAfter,
    required this.limit,
    required this.order,
    this.previousUri,
    required this.nextUri,
    required this.timestamp,
  });
  late final Null endingBefore;
  late final Null startingAfter;
  late final Null previousEndingBefore;
  late final String nextStartingAfter;
  late final int limit;
  late final String order;
  late final Null previousUri;
  late final String nextUri;
  late final String timestamp;

  Pagination.fromJson(Map<String, dynamic> json) {
    endingBefore = null;
    startingAfter = null;
    previousEndingBefore = null;
    nextStartingAfter = json['next_starting_after'];
    limit = json['limit'];
    order = json['order'];
    previousUri = null;
    nextUri = json['next_uri'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ending_before'] = endingBefore;
    _data['starting_after'] = startingAfter;
    _data['previous_ending_before'] = previousEndingBefore;
    _data['next_starting_after'] = nextStartingAfter;
    _data['limit'] = limit;
    _data['order'] = order;
    _data['previous_uri'] = previousUri;
    _data['next_uri'] = nextUri;
    _data['timestamp'] = timestamp;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.symbol,
    required this.name,
    required this.slug,
    required this.color,
    required this.imageUrl,
    required this.listed,
    this.launchedAt,
    this.description,
    required this.exponent,
    required this.unitPriceScale,
    required this.transactionUnitPriceScale,
    required this.addressRegex,
    required this.resourceUrls,
    required this.base,
    required this.currency,
    required this.rank,
    required this.marketCap,
    required this.percentChange,
    required this.latest,
    required this.volume_24h,
    required this.circulatingSupply,
    required this.tradableOnWallet,
    required this.latestPrice,
  });
  late final String id;
  late final String symbol;
  late final String name;
  late final String slug;
  late final String color;
  late final String imageUrl;
  late final bool listed;
  late final String? launchedAt;
  late final String? description;
  late final int exponent;
  late final int unitPriceScale;
  late final int transactionUnitPriceScale;
  late final String addressRegex;
  late final List<ResourceUrls> resourceUrls;
  late final String base;
  late final String currency;
  late final int rank;
  late final String marketCap;
  late final double? percentChange;
  late final String latest;
  late final String volume_24h;
  late final String circulatingSupply;
  late final bool tradableOnWallet;
  late final LatestPrice latestPrice;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    slug = json['slug'];
    color = json['color'];
    imageUrl = json['image_url'];
    listed = json['listed'];
    launchedAt = null;
    description = null;
    exponent = json['exponent'];
    unitPriceScale = json['unit_price_scale'];
    transactionUnitPriceScale = json['transaction_unit_price_scale'];
    addressRegex = json['address_regex'];
    resourceUrls = List.from(json['resource_urls'])
        .map((e) => ResourceUrls.fromJson(e))
        .toList();
    base = json['base'];
    currency = json['currency'];
    rank = json['rank'];
    marketCap = json['market_cap'];
    percentChange = json['percent_change'];
    latest = json['latest'];
    volume_24h = json['volume_24h'];
    circulatingSupply = json['circulating_supply'];
    tradableOnWallet = json['tradable_on_wallet'];
    latestPrice = LatestPrice.fromJson(json['latest_price']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['symbol'] = symbol;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['color'] = color;
    _data['image_url'] = imageUrl;
    _data['listed'] = listed;
    _data['launched_at'] = launchedAt;
    _data['description'] = description;
    _data['exponent'] = exponent;
    _data['unit_price_scale'] = unitPriceScale;
    _data['transaction_unit_price_scale'] = transactionUnitPriceScale;
    _data['address_regex'] = addressRegex;
    _data['resource_urls'] = resourceUrls.map((e) => e.toJson()).toList();
    _data['base'] = base;
    _data['currency'] = currency;
    _data['rank'] = rank;
    _data['market_cap'] = marketCap;
    _data['percent_change'] = percentChange;
    _data['latest'] = latest;
    _data['volume_24h'] = volume_24h;
    _data['circulating_supply'] = circulatingSupply;
    _data['tradable_on_wallet'] = tradableOnWallet;
    _data['latest_price'] = latestPrice.toJson();
    return _data;
  }
}

class ResourceUrls {
  ResourceUrls({
    required this.type,
    required this.iconUrl,
    required this.title,
    required this.link,
  });
  late final String type;
  late final String iconUrl;
  late final String title;
  late final String link;

  ResourceUrls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    iconUrl = json['icon_url'];
    title = json['title'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['icon_url'] = iconUrl;
    _data['title'] = title;
    _data['link'] = link;
    return _data;
  }
}

class LatestPrice {
  LatestPrice({
    required this.amount,
    required this.timestamp,
    required this.percentChange,
  });
  late final Amount amount;
  late final String timestamp;
  late final PercentChange percentChange;

  LatestPrice.fromJson(Map<String, dynamic> json) {
    amount = Amount.fromJson(json['amount']);
    timestamp = json['timestamp'];
    percentChange = PercentChange.fromJson(json['percent_change']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount.toJson();
    _data['timestamp'] = timestamp;
    _data['percent_change'] = percentChange.toJson();
    return _data;
  }
}

class Amount {
  Amount({
    required this.amount,
    required this.currency,
    required this.scale,
  });
  late final String amount;
  late final String currency;
  late final String scale;

  Amount.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    scale = json['scale'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['currency'] = currency;
    _data['scale'] = scale;
    return _data;
  }
}

class PercentChange {
  PercentChange({
    required this.hour,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
    required this.all,
  });
  late final double? hour;
  late final double? day;
  late final double week;
  late final double month;
  late final double year;
  late final double? all;

  PercentChange.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    day = json['day'];
    week = json['week'];
    month = json['month'];
    year = json['year'];
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hour'] = hour;
    _data['day'] = day;
    _data['week'] = week;
    _data['month'] = month;
    _data['year'] = year;
    _data['all'] = all;
    return _data;
  }
}
