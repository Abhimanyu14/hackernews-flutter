// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_parsing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Article extends Article {
  @override
  final String text;
  @override
  final String domain;
  @override
  final String by;
  @override
  final String age;
  @override
  final int score;
  @override
  final int commentsCount;

  factory _$Article([void Function(ArticleBuilder) updates]) =>
      (new ArticleBuilder()..update(updates)).build();

  _$Article._(
      {this.text,
      this.domain,
      this.by,
      this.age,
      this.score,
      this.commentsCount})
      : super._() {
    if (text == null) {
      throw new BuiltValueNullFieldError('Article', 'text');
    }
    if (domain == null) {
      throw new BuiltValueNullFieldError('Article', 'domain');
    }
    if (by == null) {
      throw new BuiltValueNullFieldError('Article', 'by');
    }
    if (age == null) {
      throw new BuiltValueNullFieldError('Article', 'age');
    }
    if (score == null) {
      throw new BuiltValueNullFieldError('Article', 'score');
    }
    if (commentsCount == null) {
      throw new BuiltValueNullFieldError('Article', 'commentsCount');
    }
  }

  @override
  Article rebuild(void Function(ArticleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleBuilder toBuilder() => new ArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Article &&
        text == other.text &&
        domain == other.domain &&
        by == other.by &&
        age == other.age &&
        score == other.score &&
        commentsCount == other.commentsCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, text.hashCode), domain.hashCode), by.hashCode),
                age.hashCode),
            score.hashCode),
        commentsCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Article')
          ..add('text', text)
          ..add('domain', domain)
          ..add('by', by)
          ..add('age', age)
          ..add('score', score)
          ..add('commentsCount', commentsCount))
        .toString();
  }
}

class ArticleBuilder implements Builder<Article, ArticleBuilder> {
  _$Article _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _domain;
  String get domain => _$this._domain;
  set domain(String domain) => _$this._domain = domain;

  String _by;
  String get by => _$this._by;
  set by(String by) => _$this._by = by;

  String _age;
  String get age => _$this._age;
  set age(String age) => _$this._age = age;

  int _score;
  int get score => _$this._score;
  set score(int score) => _$this._score = score;

  int _commentsCount;
  int get commentsCount => _$this._commentsCount;
  set commentsCount(int commentsCount) => _$this._commentsCount = commentsCount;

  ArticleBuilder();

  ArticleBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _domain = _$v.domain;
      _by = _$v.by;
      _age = _$v.age;
      _score = _$v.score;
      _commentsCount = _$v.commentsCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Article other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Article;
  }

  @override
  void update(void Function(ArticleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Article build() {
    final _$result = _$v ??
        new _$Article._(
            text: text,
            domain: domain,
            by: by,
            age: age,
            score: score,
            commentsCount: commentsCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
