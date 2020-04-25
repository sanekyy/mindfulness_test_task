// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Sound> _$soundSerializer = new _$SoundSerializer();

class _$SoundSerializer implements StructuredSerializer<Sound> {
  @override
  final Iterable<Type> types = const [Sound, _$Sound];
  @override
  final String wireName = 'Sound';

  @override
  Iterable<Object> serialize(Serializers serializers, Sound object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'soundUrl',
      serializers.serialize(object.soundUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Sound deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SoundBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'soundUrl':
          result.soundUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Sound extends Sound {
  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final String soundUrl;

  factory _$Sound([void Function(SoundBuilder) updates]) =>
      (new SoundBuilder()..update(updates)).build();

  _$Sound._({this.id, this.title, this.imageUrl, this.soundUrl}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Sound', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Sound', 'title');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('Sound', 'imageUrl');
    }
    if (soundUrl == null) {
      throw new BuiltValueNullFieldError('Sound', 'soundUrl');
    }
  }

  @override
  Sound rebuild(void Function(SoundBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SoundBuilder toBuilder() => new SoundBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sound &&
        id == other.id &&
        title == other.title &&
        imageUrl == other.imageUrl &&
        soundUrl == other.soundUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), title.hashCode), imageUrl.hashCode),
        soundUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Sound')
          ..add('id', id)
          ..add('title', title)
          ..add('imageUrl', imageUrl)
          ..add('soundUrl', soundUrl))
        .toString();
  }
}

class SoundBuilder implements Builder<Sound, SoundBuilder> {
  _$Sound _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _soundUrl;
  String get soundUrl => _$this._soundUrl;
  set soundUrl(String soundUrl) => _$this._soundUrl = soundUrl;

  SoundBuilder();

  SoundBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _imageUrl = _$v.imageUrl;
      _soundUrl = _$v.soundUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sound other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Sound;
  }

  @override
  void update(void Function(SoundBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Sound build() {
    final _$result = _$v ??
        new _$Sound._(
            id: id, title: title, imageUrl: imageUrl, soundUrl: soundUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
