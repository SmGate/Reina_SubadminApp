import '../../utils/Constants/api_routes.dart';
import '../../Module/Events/Model/Event.dart';
import '../../Services/Network Services/network_services.dart';

class EventRepository {
  final _apiService = NetworkServices();

  Future<Event> eventListApi(subadminid, token) async {
    dynamic response = await _apiService
        .getReq(Api.events + "/" + subadminid.toString(), bearerToken: token);
    return Event.fromJson(response);
  }
}
