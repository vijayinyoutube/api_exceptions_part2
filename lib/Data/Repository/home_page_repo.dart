import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../API/base_client.dart';
import '../Models/home_page_model.dart';

abstract class DemoRepository {
  Future<DemoModel> fetchData();
}

class DemoRepo extends DemoRepository {
  @override
  Future<DemoModel> fetchData() async {
    final response =
        await BaseClient().get('${(dotenv.env['API_BASE_URL'])}/todos/1');
    return DemoModel.fromJson(response);
  }
}
