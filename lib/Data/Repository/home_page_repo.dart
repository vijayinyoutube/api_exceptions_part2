import '../../Business_Logic/Exceptions/exception_handlers.dart';
import '../API/base_client.dart';
import '../Models/home_page_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class DemoRepository {
  Future<DemoModel> fetchData();
}

class DemoRepo extends DemoRepository {
  @override
  Future<DemoModel> fetchData() async {
   try{
      final response =
        await BaseClient().get('${(dotenv.env['API_BASE_URL'])}/todos/1');
    return DemoModel.fromJson(response);
   }
   catch(e){
     throw e.toString();
   }
  }
}
