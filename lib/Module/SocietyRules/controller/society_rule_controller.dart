import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/SocietyRules/model/add_rule_model.dart';
import 'package:societyadminapp/Module/SocietyRules/model/society_rules_model.dart';
import 'package:societyadminapp/Module/SocietyRules/service/society_rules_service.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Model/User.dart';

class SocietyRuleController extends GetxController {
  var user = Get.arguments;
  late final User userdata;
  final formKey = new GlobalKey<FormState>();
  var errorGettingSocietyRules = "".obs;
  var societyRulesModel = SocietyRuleModel();

  RxString errorAddingRule = "".obs;
  RxBool loading = false.obs;
  var addRuleModel = AddSocietyRuleModel();
  final List<Rule> rulesList = [];
  var isRuleAdded = false.obs;

  TextEditingController ruleTitleController = TextEditingController();
  TextEditingController ruleDescriptionController = TextEditingController();

  @override
  void onInit() {
    userdata = user;
    super.onInit();
  }

  Future<SocietyRuleModel> getAllRules({
    String? societyId,
  }) async {
    errorGettingSocietyRules.value = "";
    var res = await SocietyRulesService.getSocietyRule(societyId: societyId);

    if (res is SocietyRuleModel) {
      societyRulesModel = res;
      return societyRulesModel;
    } else {
      errorGettingSocietyRules.value = res.toString();
      Get.snackbar("Error", errorGettingSocietyRules.value);
    }

    return societyRulesModel;
  }

  void addSocietyRule({Payload? data}) async {
    if (rulesList.length == 0) {
      Get.snackbar("Message", "Please Enter Rules");
    }
    loading.value = true;
    errorAddingRule.value = "";

    var res = await SocietyRulesService.addSocietyRule(data: data);

    loading.value = false;

    if (res is AddSocietyRuleModel) {
      addRuleModel = res;
      ruleDescriptionController.clear();
      ruleTitleController.clear();
      rulesList.clear();
      Get.snackbar("Message", res.message ?? "");
      Get.offNamed(societyRule, arguments: user);
    } else {
      loading.value = false;
      errorAddingRule.value = res;
      Get.snackbar("Error", errorAddingRule.value);
    }
  }
}

class Rule {
  final String title;
  final String description;

  Rule({required this.title, required this.description});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}

class Payload {
  final int societyId;
  final List<Rule> rules;

  Payload({required this.societyId, required this.rules});

  Map<String, dynamic> toJson() {
    return {
      'society_id': societyId,
      'rules': rules.map((rule) => rule.toJson()).toList(),
    };
  }
}
