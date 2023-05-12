import '../../domain/models/requests/breaking_news_request.dart';
import '../../domain/models/responses/BreakingNewsResponse.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../base/base_api_repository.dart';
import '../datasources/remote/news_api_service.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository{

  final NewsApiService _newsApiService;

  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({required BreakingNewsRequest request}) {
    return getStateOf<BreakingNewsResponse>(
      request: () => _newsApiService.getBreakingNewsArticles(
            apiKey: request.apiKey,
            country: request.category,
            category: request.category,
            page: request.page,
            pageSize: request.pageSize
        ),
    );
  }
}