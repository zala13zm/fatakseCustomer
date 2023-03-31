// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.description,
    this.baseDeliveryFee,
    this.deliveryFee,
    this.deliveryRange,
    this.tax,
    this.phone,
    this.email,
    this.address,
    this.latitude,
    this.longitude,
    this.commission,
    this.pickup,
    this.delivery,
    this.isActive,
    this.chargePerKm,
    this.isOpen,
    this.vendorTypeId,
    this.autoAssignment,
    this.autoAccept,
    this.allowScheduleOrder,
    this.hasSubCategories,
    this.minOrder,
    this.maxOrder,
    this.useSubscription,
    this.hasDrivers,
    this.prepareTime,
    this.deliveryTime,
    this.inOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.creatorId,
    this.formattedDate,
    this.logo,
    this.featureImage,
    this.rating,
    this.canRate,
    this.slots,
    this.isPackageVendor,
    this.hasSubscription,
    this.vendorType,
    this.days,
    this.openToday,
    this.openNow,
  });

  int id;
  String name;
  String description;
  int baseDeliveryFee;
  int deliveryFee;
  int deliveryRange;
  String tax;
  String phone;
  String email;
  String address;
  String latitude;
  String longitude;
  int commission;
  int pickup;
  int delivery;
  int isActive;
  int chargePerKm;
  bool isOpen;
  int vendorTypeId;
  int autoAssignment;
  int autoAccept;
  bool allowScheduleOrder;
  bool hasSubCategories;
  int minOrder;
  int maxOrder;
  bool useSubscription;
  int hasDrivers;
  String prepareTime;
  String deliveryTime;
  int inOrder;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic creatorId;
  String formattedDate;
  String logo;
  String featureImage;
  int rating;
  bool canRate;
  List<Slot> slots;
  int isPackageVendor;
  bool hasSubscription;
  VendorType vendorType;
  List<Day> days;
  List<Day> openToday;
  List<Day> openNow;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        baseDeliveryFee: json["base_delivery_fee"],
        deliveryFee: json["delivery_fee"],
        deliveryRange: json["delivery_range"],
        tax: json["tax"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        commission: json["commission"],
        pickup: json["pickup"],
        delivery: json["delivery"],
        isActive: json["is_active"],
        chargePerKm: json["charge_per_km"],
        isOpen: json["is_open"],
        vendorTypeId: json["vendor_type_id"],
        autoAssignment: json["auto_assignment"],
        autoAccept: json["auto_accept"],
        allowScheduleOrder: json["allow_schedule_order"],
        hasSubCategories: json["has_sub_categories"],
        minOrder: json["min_order"],
        maxOrder: json["max_order"],
        useSubscription: json["use_subscription"],
        hasDrivers: json["has_drivers"],
        prepareTime: json["prepare_time"],
        deliveryTime: json["delivery_time"],
        inOrder: json["in_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        creatorId: json["creator_id"],
        formattedDate: json["formatted_date"],
        logo: json["logo"],
        featureImage: json["feature_image"],
        rating: json["rating"],
        canRate: json["can_rate"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        isPackageVendor: json["is_package_vendor"],
        hasSubscription: json["has_subscription"],
        vendorType: VendorType.fromJson(json["vendor_type"]),
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
        openToday:
            List<Day>.from(json["open_today"].map((x) => Day.fromJson(x))),
        openNow: List<Day>.from(json["open_now"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "base_delivery_fee": baseDeliveryFee,
        "delivery_fee": deliveryFee,
        "delivery_range": deliveryRange,
        "tax": tax,
        "phone": phone,
        "email": email,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "commission": commission,
        "pickup": pickup,
        "delivery": delivery,
        "is_active": isActive,
        "charge_per_km": chargePerKm,
        "is_open": isOpen,
        "vendor_type_id": vendorTypeId,
        "auto_assignment": autoAssignment,
        "auto_accept": autoAccept,
        "allow_schedule_order": allowScheduleOrder,
        "has_sub_categories": hasSubCategories,
        "min_order": minOrder,
        "max_order": maxOrder,
        "use_subscription": useSubscription,
        "has_drivers": hasDrivers,
        "prepare_time": prepareTime,
        "delivery_time": deliveryTime,
        "in_order": inOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "creator_id": creatorId,
        "formatted_date": formattedDate,
        "logo": logo,
        "feature_image": featureImage,
        "rating": rating,
        "can_rate": canRate,
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "is_package_vendor": isPackageVendor,
        "has_subscription": hasSubscription,
        "vendor_type": vendorType.toJson(),
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
        "open_today": List<dynamic>.from(openToday.map((x) => x.toJson())),
        "open_now": List<dynamic>.from(openNow.map((x) => x.toJson())),
      };
}

class Day {
  Day({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int id;
  DayName name;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        name: dayNameValues.map[json["name"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": dayNameValues.reverse[name],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

enum DayName { SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY }

final dayNameValues = EnumValues({
  "Friday": DayName.FRIDAY,
  "Monday": DayName.MONDAY,
  "Saturday": DayName.SATURDAY,
  "Sunday": DayName.SUNDAY,
  "Thursday": DayName.THURSDAY,
  "Tuesday": DayName.TUESDAY,
  "Wednesday": DayName.WEDNESDAY
});

class Pivot {
  Pivot({
    this.vendorId,
    this.dayId,
    this.id,
    this.open,
    this.close,
  });

  int vendorId;
  int dayId;
  int id;
  String open;
  String close;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        vendorId: json["vendor_id"],
        dayId: json["day_id"],
        id: json["id"],
        open: json["open"],
        close: json["close"],
      );

  Map<String, dynamic> toJson() => {
        "vendor_id": vendorId,
        "day_id": dayId,
        "id": id,
        "open": open,
        "close": close,
      };
}

class Slot {
  Slot({
    this.date,
    this.times,
  });

  DateTime date;
  List<String> times;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        date: DateTime.parse(json["date"]),
        times: List<String>.from(json["times"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "times": List<dynamic>.from(times.map((x) => x)),
      };
}

class VendorType {
  VendorType({
    this.id,
    this.name,
    this.color,
    this.description,
    this.slug,
    this.isActive,
    this.inOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.formattedDate,
    this.logo,
    this.websiteHeader,
  });

  int id;
  VendorTypeName name;
  Color color;
  Description description;
  Slug slug;
  int isActive;
  int inOrder;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  FormattedDate formattedDate;
  String logo;
  String websiteHeader;

  factory VendorType.fromJson(Map<String, dynamic> json) => VendorType(
        id: json["id"],
        name: vendorTypeNameValues.map[json["name"]],
        color: colorValues.map[json["color"]],
        description: descriptionValues.map[json["description"]],
        slug: slugValues.map[json["slug"]],
        isActive: json["is_active"],
        inOrder: json["in_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        formattedDate: formattedDateValues.map[json["formatted_date"]],
        logo: json["logo"],
        websiteHeader: json["website_header"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": vendorTypeNameValues.reverse[name],
        "color": colorValues.reverse[color],
        "description": descriptionValues.reverse[description],
        "slug": slugValues.reverse[slug],
        "is_active": isActive,
        "in_order": inOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "formatted_date": formattedDateValues.reverse[formattedDate],
        "logo": logo,
        "website_header": websiteHeader,
      };
}

enum Color { F9941_F }

final colorValues = EnumValues({"#f9941f": Color.F9941_F});

enum Description { FRESH_TASTE_AT_BEST_PRICE }

final descriptionValues = EnumValues(
    {"Fresh Taste At Best Price": Description.FRESH_TASTE_AT_BEST_PRICE});

enum FormattedDate { THE_30_JUN_2021 }

final formattedDateValues =
    EnumValues({"30 Jun 2021": FormattedDate.THE_30_JUN_2021});

enum VendorTypeName { RESTAURANTS }

final vendorTypeNameValues =
    EnumValues({" Restaurants": VendorTypeName.RESTAURANTS});

enum Slug { FOOD }

final slugValues = EnumValues({"food": Slug.FOOD});

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
