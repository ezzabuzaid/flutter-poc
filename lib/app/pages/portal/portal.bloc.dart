import 'package:learning_flutter/app/pages/portal/portal.model.dart';

import 'portal.service.dart';

class PortalBloc {
  final _service = PortalService();

  login(username, password) {
    this._service.login(LoginModel(username: username, password: password));
  }

//   final _moviesFetcher = PublishSubject<portalmode>();

//   Observable<ItemModel> get allMovies => _moviesFetcher.stream;
//   fetchAllMovies() async {
//     ItemModel itemModel = await _service.fetchAllMovies();
//     _moviesFetcher.sink.add(itemModel);
//   }

//   dispose() {
//     _moviesFetcher.close();
//   }
}

final portalBloc = PortalBloc();
