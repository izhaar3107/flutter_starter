import 'package:app/integrations/models/follower_model.dart';

import 'config.dart';
import 'network_utils.dart';

/// GET method demo
Future<List<FollowerModel>> getFollowers() async {
  var result = await handleResponse(await getRequest('$baseURL/users/octocat/followers'));

  Iterable list = result;
  return list.map((model) => FollowerModel.fromJson(model)).toList();
}

/// POST method demo
Future createEmployee(Map req) async {
  return handleResponse(await postRequest('http://dummy.restapiexample.com/api/v1/create', req));
}
