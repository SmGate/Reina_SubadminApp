import 'package:societyadminapp/Module/SocietyRules/controller/society_rule_controller.dart';
import 'package:societyadminapp/Module/SocietyRules/model/add_rule_model.dart';
import 'package:societyadminapp/Module/SocietyRules/model/society_rules_model.dart';
import 'package:societyadminapp/utils/Constants/api_routes.dart';
import 'package:societyadminapp/utils/Constants/base_client.dart';
import 'package:http/http.dart' as http;

class SocietyRulesService {
  static Future<dynamic> getSocietyRule({
    String? societyId,
  }) async {
    try {
      var url = "${Api.getAllSocietyRule}/$societyId";

      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return societyRuleModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> addSocietyRule({Payload? data}) async {
    try {
      var url = "${Api.addSocietyRule}";

      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return addSocietyRuleModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
