// To parse this JSON data, do
//
//     final demo = demoFromJson(jsonString);

import 'dart:convert';

ConfigModel demoFromJson(String str) => ConfigModel.fromJson(json.decode(str));

String demoToJson(ConfigModel data) => json.encode(data.toJson());

class ConfigModel {
  ConfigModel({
    this.agentAutoSet,
    this.matchAbortTime,
    this.singleQuotaLimitMin,
    this.profitCommission,
    this.singleQuotaLimitMax,
    this.withdrawLimitMin,
    this.downloadAppAddress,
    this.withdrawCharges,
    this.isClose,
    this.withdrawLimitMax,
    this.isOpenPowwi,
    this.cdn,
  });

  String agentAutoSet;
  String matchAbortTime;
  String singleQuotaLimitMin;
  String profitCommission;
  String singleQuotaLimitMax;
  String withdrawLimitMin;
  String downloadAppAddress;
  String withdrawCharges;
  String isClose;
  String withdrawLimitMax;
  String isOpenPowwi;
  String cdn;

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
        agentAutoSet: json["agent_auto_set"],
        matchAbortTime: json["match_abort_time"],
        singleQuotaLimitMin: json["single_quota_limit_min"],
        profitCommission: json["profit_commission"],
        singleQuotaLimitMax: json["single_quota_limit_max"],
        withdrawLimitMin: json["withdraw_limit_min"],
        downloadAppAddress: json["download_app_address"],
        withdrawCharges: json["withdraw_charges"],
        isClose: json["is_close"],
        withdrawLimitMax: json["withdraw_limit_max"],
        isOpenPowwi: json["is_open_powwi"],
        cdn: json["cdn"],
      );

  Map<String, dynamic> toJson() => {
        "agent_auto_set": agentAutoSet,
        "match_abort_time": matchAbortTime,
        "single_quota_limit_min": singleQuotaLimitMin,
        "profit_commission": profitCommission,
        "single_quota_limit_max": singleQuotaLimitMax,
        "withdraw_limit_min": withdrawLimitMin,
        "download_app_address": downloadAppAddress,
        "withdraw_charges": withdrawCharges,
        "is_close": isClose,
        "withdraw_limit_max": withdrawLimitMax,
        "is_open_powwi": isOpenPowwi,
        "cdn": cdn,
      };
}
