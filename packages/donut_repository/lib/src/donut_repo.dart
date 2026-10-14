import 'package:donut_repository/donut_repository.dart';

abstract class DonutRepo {
  Stream<List<Donut>> getDonuts();
}
