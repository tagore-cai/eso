import 'dart:async';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:eso/database/rule.dart';
import 'package:eso/database/rule_dao.dart';
import 'package:floor/floor.dart';

class RuleDaoWin extends RuleDao {
  RuleDaoWin(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _ruleInsertionAdapter = InsertionAdapter(
            database,
            'Rule',
            (Rule item) => <String, dynamic>{
                  'id': item.id,
                  'createTime': item.createTime,
                  'modifiedTime': item.modifiedTime,
                  'author': item.author,
                  'postScript': item.postScript,
                  'name': item.name,
                  'host': item.host,
                  'contentType': item.contentType,
                  'group': item.group,
                  'sort': item.sort,
                  'viewStyle': item.viewStyle,
                  'useCryptoJS':
                      item.useCryptoJS == null ? null : (item.useCryptoJS ? 1 : 0),
                  'loadJs': item.loadJs,
                  'userAgent': item.userAgent,
                  'loginUrl': item.loginUrl,
                  'cookies': item.cookies,
                  'enableDiscover':
                      item.enableDiscover == null ? null : (item.enableDiscover ? 1 : 0),
                  'discoverUrl': item.discoverUrl,
                  'discoverItems': item.discoverItems,
                  'discoverList': item.discoverList,
                  'discoverTags': item.discoverTags,
                  'discoverName': item.discoverName,
                  'discoverCover': item.discoverCover,
                  'discoverAuthor': item.discoverAuthor,
                  'discoverChapter': item.discoverChapter,
                  'discoverDescription': item.discoverDescription,
                  'discoverResult': item.discoverResult,
                  'enableSearch':
                      item.enableSearch == null ? null : (item.enableSearch ? 1 : 0),
                  'searchUrl': item.searchUrl,
                  'searchItems': item.searchItems,
                  'searchList': item.searchList,
                  'searchTags': item.searchTags,
                  'searchName': item.searchName,
                  'searchCover': item.searchCover,
                  'searchAuthor': item.searchAuthor,
                  'searchChapter': item.searchChapter,
                  'searchDescription': item.searchDescription,
                  'searchResult': item.searchResult,
                  'enableMultiRoads': item.enableMultiRoads == null
                      ? null
                      : (item.enableMultiRoads ? 1 : 0),
                  'chapterRoads': item.chapterRoads,
                  'chapterRoadName': item.chapterRoadName,
                  'chapterUrl': item.chapterUrl,
                  'chapterItems': item.chapterItems,
                  'chapterList': item.chapterList,
                  'chapterName': item.chapterName,
                  'chapterCover': item.chapterCover,
                  'chapterLock': item.chapterLock,
                  'chapterTime': item.chapterTime,
                  'chapterResult': item.chapterResult,
                  'contentUrl': item.contentUrl,
                  'contentItems': item.contentItems
                }),
        _ruleDeletionAdapter = DeletionAdapter(
            database,
            'Rule',
            ['id'],
            (Rule item) => <String, dynamic>{
                  'id': item.id,
                  'createTime': item.createTime,
                  'modifiedTime': item.modifiedTime,
                  'author': item.author,
                  'postScript': item.postScript,
                  'name': item.name,
                  'host': item.host,
                  'contentType': item.contentType,
                  'group': item.group,
                  'sort': item.sort,
                  'viewStyle': item.viewStyle,
                  'useCryptoJS':
                      item.useCryptoJS == null ? null : (item.useCryptoJS ? 1 : 0),
                  'loadJs': item.loadJs,
                  'userAgent': item.userAgent,
                  'loginUrl': item.loginUrl,
                  'cookies': item.cookies,
                  'enableDiscover':
                      item.enableDiscover == null ? null : (item.enableDiscover ? 1 : 0),
                  'discoverUrl': item.discoverUrl,
                  'discoverItems': item.discoverItems,
                  'discoverList': item.discoverList,
                  'discoverTags': item.discoverTags,
                  'discoverName': item.discoverName,
                  'discoverCover': item.discoverCover,
                  'discoverAuthor': item.discoverAuthor,
                  'discoverChapter': item.discoverChapter,
                  'discoverDescription': item.discoverDescription,
                  'discoverResult': item.discoverResult,
                  'enableSearch':
                      item.enableSearch == null ? null : (item.enableSearch ? 1 : 0),
                  'searchUrl': item.searchUrl,
                  'searchItems': item.searchItems,
                  'searchList': item.searchList,
                  'searchTags': item.searchTags,
                  'searchName': item.searchName,
                  'searchCover': item.searchCover,
                  'searchAuthor': item.searchAuthor,
                  'searchChapter': item.searchChapter,
                  'searchDescription': item.searchDescription,
                  'searchResult': item.searchResult,
                  'enableMultiRoads': item.enableMultiRoads == null
                      ? null
                      : (item.enableMultiRoads ? 1 : 0),
                  'chapterRoads': item.chapterRoads,
                  'chapterRoadName': item.chapterRoadName,
                  'chapterUrl': item.chapterUrl,
                  'chapterItems': item.chapterItems,
                  'chapterList': item.chapterList,
                  'chapterName': item.chapterName,
                  'chapterCover': item.chapterCover,
                  'chapterLock': item.chapterLock,
                  'chapterTime': item.chapterTime,
                  'chapterResult': item.chapterResult,
                  'contentUrl': item.contentUrl,
                  'contentItems': item.contentItems
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _ruleMapper = (Map<String, dynamic> row) => Rule(
        row['id'],
        row['createTime'],
        row['modifiedTime'],
        row['author'],
        row['name'],
        row['host'],
        row['group'],
        row['postScript'],
        row['contentType'],
        row['sort'],
        row['viewStyle'],
        row['useCryptoJS'] as int != 0,
        row['loadJs'],
        row['userAgent'],
        row['loginUrl'],
        row['cookies'],
        row['enableDiscover'] as int != 0,
        row['discoverUrl'],
        row['discoverNextUrl'],
        row['discoverItems'],
        row['discoverList'],
        row['discoverTags'],
        row['discoverName'],
        row['discoverCover'],
        row['discoverAuthor'],
        row['discoverChapter'],
        row['discoverDescription'],
        row['discoverResult'],
        row['enableSearch'] as int != 0,
        row['searchUrl'],
        row['searchNextUrl'],
        row['searchItems'],
        row['searchList'],
        row['searchTags'],
        row['searchName'],
        row['searchCover'],
        row['searchAuthor'],
        row['searchChapter'],
        row['searchDescription'],
        row['searchResult'],
        row['enableMultiRoads'] as int != 0,
        row['chapterUrl'],
        row['chapterNextUrl'],
        row['chapterRoads'],
        row['chapterRoadName'],
        row['chapterItems'],
        row['chapterList'],
        row['chapterName'],
        row['chapterCover'],
        row['chapterLock'],
        row['chapterTime'],
        row['chapterResult'],
        row['contentUrl'],
        row['contentNextUrl'],
        row['contentItems'],
      );

  final InsertionAdapter<Rule> _ruleInsertionAdapter;

  final DeletionAdapter<Rule> _ruleDeletionAdapter;

  @override
  Future<Rule> findRuleById(String id) async {
    return _queryAdapter.query('SELECT * FROM rule WHERE id = ?',
        arguments: <dynamic>[id], mapper: _ruleMapper);
  }

  @override
  Future<List<Rule>> findAllRules() async {
    return _queryAdapter.queryList('SELECT * FROM rule ORDER BY ${RuleDao.order}',
        mapper: _ruleMapper);
  }

  @override
  Future<List<Rule>> findAllDiscoverRules() async {
    return _queryAdapter.queryList(
        'SELECT * FROM rule where enableDiscover = 1 ORDER BY ${RuleDao.order}',
        mapper: _ruleMapper);
  }

  @override
  Future<Rule> findMaxSort() async {
    return _queryAdapter.query('SELECT * FROM rule order by sort desc limit 1',
        mapper: _ruleMapper);
  }

  @override
  Future<void> clearAllRules() async {
    await _queryAdapter.queryNoReturn('DELETE FROM rule');
  }

  @override
  Future<List<Rule>> getRuleByName(String name, String group) async {
    return _queryAdapter.queryList(
        'SELECT * FROM rule WHERE name like ? or `group` like ? ORDER BY ${RuleDao.order}',
        arguments: <dynamic>[name, group],
        mapper: _ruleMapper);
  }

  @override
  Future<List<Rule>> getDiscoverRuleByName(String name, String group) async {
    return _queryAdapter.queryList(
        'SELECT * FROM rule WHERE enableDiscover = 1 and (name like ? or `group` like ?) ORDER BY ${RuleDao.order}',
        arguments: <dynamic>[name, group],
        mapper: _ruleMapper);
  }

  @override
  Future<int> insertOrUpdateRule(Rule rule) {
    return _ruleInsertionAdapter.insertAndReturnId(rule, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertOrUpdateRules(List<Rule> rules) {
    return _ruleInsertionAdapter.insertListAndReturnIds(
        rules, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteRule(Rule rule) {
    return _ruleDeletionAdapter.deleteAndReturnChangedRows(rule);
  }

  @override
  Future<int> deleteRules(List<Rule> rules) {
    return _ruleDeletionAdapter.deleteListAndReturnChangedRows(rules);
  }
}
