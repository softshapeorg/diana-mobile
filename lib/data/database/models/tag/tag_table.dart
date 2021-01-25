import 'package:diana/data/database/app_database/app_database.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:diana/data/remote_models/tag/tag_result.dart';

@DataClassName('TagData')
class TagTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().customConstraint('REFERENCES user_table(id)')();
  TextColumn get name => text()();
  IntColumn get color => integer()();

  @override
  String get tableName => 'tag_table';

  @override
  Set<Column> get primaryKey => {id};

  static List<TagTableCompanion> fromTagResponse(List<TagResult> tags) {
    return tags
        .map((tag) => TagTableCompanion(
              id: Value(tag.id),
              userId: Value(tag.userId),
              name: Value(tag.name),
              color: Value(tag.color),
            ))
        .toList();
  }
}
