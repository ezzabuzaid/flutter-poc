import 'package:learning_flutter/pages/portal/portal.model.dart';

import 'portal.service.dart';

class PortalBloc {
  final _service = PortalService();

  login(LoginModel payload) {
    this._service.login(payload);
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
