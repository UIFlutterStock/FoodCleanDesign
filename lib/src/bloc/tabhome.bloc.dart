import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class TabHomeBloc extends BlocBase {
  final BehaviorSubject<int> _indexTabController = new BehaviorSubject<int>();

  Stream<int> get indexTabFlux => _indexTabController.stream;

  Sink<int> get indexTabEvent => _indexTabController.sink;

  @override
  void dispose() {
    _indexTabController?.close();
    super.dispose();
  }
}
