import 'package:json_annotation/json_annotation.dart';

part 'tile.g.dart';

@JsonSerializable(anyMap: true)
class Tile {
  //Unique id used as ValueKey for the TileWidget
  final String id;
  //The number on the tile
  final int value;
  //The index of the tile on the board from which the position of the tile will be calculated
  final int index;
  //The next index of the tile on the board
  final int? nextIndex;
  //Whether the tile was merged with another tile
  final bool merged;

  String? imagePath;

  Tile(this.id, this.value, this.index, {this.nextIndex, this.merged = false}) {
    switch (value) {
      case 2:
        imagePath = 'assets/images/a.png';
        break;
      case 4:
        imagePath = 'assets/images/ba.png';
        break;
      case 8:
        imagePath = 'assets/images/ka.png';
        break;
      case 16:
        imagePath = 'assets/images/e.png';
        break;
      case 32:
        imagePath = 'assets/images/ga.png';
        break;
      case 64:
        imagePath = 'assets/images/ha.png';
        break;
      case 128:
        imagePath = 'assets/images/la.png';
        break;
      case 256:
        imagePath = 'assets/images/ma.png';
        break;
      case 512:
        imagePath = 'assets/images/na.png';
        break;
      case 1024:
        imagePath = 'assets/images/nga.png';
        break;
      case 2048:
        imagePath = 'assets/images/o.png';
        break;
      case 4096:
        imagePath = 'assets/images/pa.png';
        break;
    }
  }

  //Calculate the current top position based on the current index
  double getTop(double size) {
    var i = ((index + 1) / 4).ceil();
    return ((i - 1) * size) + (12.0 * i);
  }

  //Calculate the current left position based on the current index
  double getLeft(double size) {
    var i = (index - (((index + 1) / 4).ceil() * 4 - 4));
    return (i * size) + (12.0 * (i + 1));
  }

  //Calculate the next top position based on the next index
  double? getNextTop(double size) {
    if (nextIndex == null) return null;
    var i = ((nextIndex! + 1) / 4).ceil();
    return ((i - 1) * size) + (12.0 * i);
  }

  //Calculate the next top position based on the next index
  double? getNextLeft(double size) {
    if (nextIndex == null) return null;
    var i = (nextIndex! - (((nextIndex! + 1) / 4).ceil() * 4 - 4));
    return (i * size) + (12.0 * (i + 1));
  }

  //Create an immutable copy of the tile
  Tile copyWith(
          {String? id, int? value, int? index, int? nextIndex, bool? merged}) =>
      Tile(id ?? this.id, value ?? this.value, index ?? this.index,
          nextIndex: nextIndex ?? this.nextIndex,
          merged: merged ?? this.merged);

  //Create a Tile from json data
  factory Tile.fromJson(Map<String, dynamic> json) => _$TileFromJson(json);

  //Generate json data from the Tile
  Map<String, dynamic> toJson() => _$TileToJson(this);
}
