import '../../domain/models/requests/breaking_news_request.dart';
import '../../domain/models/responses/Articles.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/constants/nums.dart';
import '../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';
import 'remote_articles_state.dart';

class RemoteArticlesCubit extends BaseCubit<RemoteArticlesState, List<Article>>{

  RemoteArticlesCubit(this._apiRepository): super(const RemoteArticlesLoading(), []);

  final ApiRepository _apiRepository;
  int _page = 1;

  Future<void> getBreakingArticles() async {
    if(isBusy) return;

    await run(() async {
      final response = await _apiRepository.getBreakingNewsArticles(request: BreakingNewsRequest(page: 1));

      if(response is DataSuccess){
        final articles = response.data?.articles;
        if(articles == null) return;
        final noMoreData = articles.length < defaultPageSize;

        data.addAll(articles);
        _page++;

        emit(RemoteArticlesSuccess(
          articles: data,
          noMoreData: noMoreData
        ));
      }else{
        emit(RemoteArticlesFailed(
          error: response.error
        ));
      }
    });
  }
}