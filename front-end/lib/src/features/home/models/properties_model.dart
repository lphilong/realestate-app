import 'dart:convert';

PropsModel? propsModelFromJson(String str) =>
    PropsModel.fromJson(json.decode(str));

String propsModelToJson(PropsModel? data) => json.encode(data!.toJson());

class PropsModel {
  PropsModel({
    this.status,
    this.message,
    required this.data,
  });

  String? status;
  String? message;
  List<Props?> data;

  factory PropsModel.fromJson(Map<String, dynamic> json) => PropsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == ""
            ? []
            : List<Props?>.from(json["data"].map((x) => Props.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x!.toJson())),
      };
}

class Props {
  Props({
    this.id,
    this.conversationId,
    this.currentUsername,
    this.userName,
    this.forSale,
    this.forRentLong,
    this.forRentShort,
    this.priceSale,
    this.priceRentLong,
    this.priceRentShort,
    this.typeName,
    this.subtypeName,
    this.status,
    this.floor,
    this.description,
    this.address1,
    this.address2,
    this.countryName,
    this.provinceName,
    this.districtName,
    this.wardName,
    this.commission,
    this.commissionPct,
    this.commissionListAgent,
    this.commissionListAgentPct,
    this.commissionSellAgent,
    this.commissionSellAgentPct,
    this.beds,
    this.baths,
    this.builtSpace,
    this.gardenSpace,
    this.terraceSpace,
    this.currency,
    this.dimension,
    this.created,
    this.updated,
    this.picProperties,
  });

  int? id;
  int? conversationId;
  String? currentUsername;
  String? userName;
  bool? forSale;
  bool? forRentLong;
  bool? forRentShort;
  int? priceSale;
  int? priceRentLong;
  int? priceRentShort;
  String? typeName;
  String? subtypeName;
  String? status;
  int? floor;
  String? description;
  String? address1;
  String? address2;
  String? countryName;
  String? provinceName;
  String? districtName;
  String? wardName;
  int? commission;
  int? commissionPct;
  int? commissionListAgent;
  int? commissionListAgentPct;
  int? commissionSellAgent;
  int? commissionSellAgentPct;
  int? beds;
  int? baths;
  int? builtSpace;
  int? gardenSpace;
  int? terraceSpace;
  String? currency;
  String? dimension;
  DateTime? created;
  DateTime? updated;
  List<String?>? picProperties;

  factory Props.fromJson(Map<String, dynamic> json) => Props(
        id: json["id"],
        conversationId: json["conversation_id"],
        currentUsername: json["current_username"],
        userName: json["user_name"],
        forSale: json["forSale"],
        forRentLong: json["forRentLong"],
        forRentShort: json["forRentShort"],
        priceSale: json["priceSale"],
        priceRentLong: json["priceRentLong"],
        priceRentShort: json["priceRentShort"],
        typeName: json["type_name"],
        subtypeName: json["subtype_name"],
        status: json["status"],
        floor: json["floor"],
        description: json["description"],
        address1: json["address1"],
        address2: json["address2"],
        countryName: json["country_name"],
        provinceName: json["province_name"],
        districtName: json["district_name"],
        wardName: json["ward_name"],
        commission: json["commission"],
        commissionPct: json["commission_pct"],
        commissionListAgent: json["commission_list_agent"],
        commissionListAgentPct: json["commission_list_agent_pct"],
        commissionSellAgent: json["commission_sell_agent"],
        commissionSellAgentPct: json["commission_sell_agent_pct"],
        beds: json["beds"],
        baths: json["baths"],
        builtSpace: json["built_space"],
        gardenSpace: json["garden_space"],
        terraceSpace: json["terrace_space"],
        currency: json["currency"],
        dimension: json["dimension"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        picProperties: json["pic_properties"] == null
            ? []
            : List<String?>.from(json["pic_properties"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "conversation_id": conversationId,
        "current_username": currentUsername,
        "user_name": userName,
        "forSale": forSale,
        "forRentLong": forRentLong,
        "forRentShort": forRentShort,
        "priceSale": priceSale,
        "priceRentLong": priceRentLong,
        "priceRentShort": priceRentShort,
        "type_name": typeName,
        "subtype_name": subtypeName,
        "status": status,
        "floor": floor,
        "description": description,
        "address1": address1,
        "address2": address2,
        "country_name": countryName,
        "province_name": provinceName,
        "district_name": districtName,
        "ward_name": wardName,
        "commission": commission,
        "commission_pct": commissionPct,
        "commission_list_agent": commissionListAgent,
        "commission_list_agent_pct": commissionListAgentPct,
        "commission_sell_agent": commissionSellAgent,
        "commission_sell_agent_pct": commissionSellAgentPct,
        "beds": beds,
        "baths": baths,
        "built_space": builtSpace,
        "garden_space": gardenSpace,
        "terrace_space": terraceSpace,
        "currency": currency,
        "dimension": dimension,
        "created":
            "${created!.year.toString().padLeft(4, '0')}-${created!.month.toString().padLeft(2, '0')}-${created!.day.toString().padLeft(2, '0')}",
        "updated":
            "${updated!.year.toString().padLeft(4, '0')}-${updated!.month.toString().padLeft(2, '0')}-${updated!.day.toString().padLeft(2, '0')}",
        "pic_properties": picProperties == null
            ? []
            : List<dynamic>.from(picProperties!.map((x) => x)),
      };
}
