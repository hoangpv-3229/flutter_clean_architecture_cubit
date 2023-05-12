import '../../utils/resources/data_state.dart';
import '../models/requests/breaking_news_request.dart';
import '../models/responses/BreakingNewsResponse.dart';

abstract class ApiRepository {

  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles(
      {required BreakingNewsRequest request});

}
