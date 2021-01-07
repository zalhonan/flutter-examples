import 'package:github/github.dart';
import 'package:mobx/mobx.dart';

part 'github_store.g.dart';

class GithubStore = _GithubStore with _$GithubStore;

abstract class _GithubStore with Store {
  final GitHub client = GitHub();

  // лист репозиториев
  @observable
  List<Repository> repositories = [];

  // юзер
  @observable
  String user = '';

  // определяем поустой лист для дальнейшего сравнения
  static ObservableFuture<List<Repository>> emptyResponse =
      ObservableFuture.value([]);

  // Начинаем с пустого листа
  @observable
  ObservableFuture<List<Repository>> fetchReposFuture = emptyResponse;

  // считаем. есть лирезультат
  @computed
  bool get hasResults =>
      fetchReposFuture != emptyResponse &&
      fetchReposFuture.status == FutureStatus.fulfilled;

  // собственно запрос к сети
  @action
  Future<List<Repository>> fetchRepos() async {
    final future = client.repositories.listUserRepositories(user).toList();
    fetchReposFuture = ObservableFuture(future);

    return repositories = await future;
  }

  // установка нового юзера
  @action
  void setUser(String text) {
    fetchReposFuture = emptyResponse;
    user = text;
  }
}
