import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import './stores/github_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GithubExample(),
    );
  }
}

class GithubExample extends StatefulWidget {
  const GithubExample();

  @override
  GithubExampleState createState() => GithubExampleState();
}

class GithubExampleState extends State<GithubExample> {

  // определили стор
  final GithubStore store = GithubStore();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Github Repos'),
        ),
        body: Column(
          children: <Widget>[
            UserInput(store),
            ShowError(store),
            LoadingIndicator(store),
            RepositoryListView(store)
          ],
        ),
      );
}

class UserInput extends StatelessWidget {
  const UserInput(this.store);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextField(
                autocorrect: false,
                autofocus: true,
                onSubmitted: (String user) {
                  store.setUser(user);

                  // ignore: cascade_invocations
                  store.fetchRepos();
                },
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: store.fetchRepos,
          )
        ],
      );
}


class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator(this.store);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => store.fetchReposFuture.status == FutureStatus.pending
          ? const LinearProgressIndicator()
          : Container());
}

class RepositoryListView extends StatelessWidget {
  const RepositoryListView(this.store);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Observer(
          builder: (_) {
            if (!store.hasResults) {
              return Container();
            }

            if (store.repositories.isEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('We could not find any repos for user: '),
                  Text(
                    store.user,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }

            return ListView.builder(
                itemCount: store.repositories.length,
                itemBuilder: (_, int index) {
                  final repo = store.repositories[index];
                  return ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          repo.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(' (${repo.stargazersCount} ⭐️)'),
                      ],
                    ),
                    subtitle: Text(repo.description ?? ''),
                  );
                });
          },
        ),
      );
}



class ShowError extends StatelessWidget {
  const ShowError(this.store);

  final GithubStore store;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => store.fetchReposFuture.status == FutureStatus.rejected
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    const Icon(
                      Icons.warning,
                      color: Colors.deepOrange,
                    ),
                    Container(
                      width: 8,
                    ),
                    const Text(
                      'Failed to fetch repos for',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    Text(
                      store.user,
                      style: const TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    )
                  ])
            : Container(),
      );
}
