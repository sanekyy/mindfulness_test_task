import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sound.g.dart';

abstract class Sound implements Built<Sound, SoundBuilder> {
  static Serializer<Sound> get serializer => _$soundSerializer;

  String get id;

  String get title;

  String get imageUrl;

  String get soundUrl;

  Sound._();

  factory Sound([void Function(SoundBuilder) updates]) = _$Sound;
}
