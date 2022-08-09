part of 'models.dart';

class LevelModel extends Equatable {
  const LevelModel({
    this.mlevelpk,
    this.levelcode,
    this.lowerlimit,
    this.upperlimit,
  });

  final int? mlevelpk;
  final String? levelcode;
  final int? lowerlimit;
  final int? upperlimit;

  LevelModel copyWith({
    int? mlevelpk,
    String? levelcode,
    int? lowerlimit,
    int? upperlimit,
  }) =>
      LevelModel(
        mlevelpk: mlevelpk ?? this.mlevelpk,
        levelcode: levelcode ?? this.levelcode,
        lowerlimit: lowerlimit ?? this.lowerlimit,
        upperlimit: upperlimit ?? this.upperlimit,
      );

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        mlevelpk: json['mlevelpk'] ?? 0,
        levelcode: json['levelcode']?.trim() ?? '',
        lowerlimit: json['lowerlimit'] ?? 0,
        upperlimit: json['upperlimit'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "mlevelpk": mlevelpk,
        "levelcode": levelcode,
        "lowerlimit": lowerlimit,
        "upperlimit": upperlimit,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        mlevelpk,
        levelcode,
        lowerlimit,
        upperlimit,
      ];
}
