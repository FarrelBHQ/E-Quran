import 'dart:convert';
import 'package:quran/model/ayah.dart';


List<Surah> surahFromJson(String str) =>  List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahToJson(List<Surah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah{
  int number;
  String name;
  String latinName;
  int totalAyah;
  String nuzul;
  String meaning;
  String desc;
  String audio;
  List<Ayat>? ayah;

  Surah({
    required this.number,
    required this.name,
    required this.latinName,
    required this.totalAyah,
    required this.nuzul,
    required this.meaning,
    required this.desc,
    required this.audio,
    this.ayah
  });

  factory Surah.fromJson(Map<String, dynamic> json) =>Surah(
    number: json['nomor'],
    name: json['nama'],
    latinName: json['nama_latin'],
    totalAyah: json['jumlah_ayat'],
    nuzul: json['tempat_turun'],
    meaning: json['arti'],
    desc: json['deskripsi'],
    audio: json['audio'],
    ayah: json.containsKey("ayat")?
        List<Ayat>.from(json['ayat'].map((x) => Ayat.fromJson(x))) : null
  );

  Map<String, dynamic> toJson() => {
    'nomor': number,
    'nama': name,
    'nama_latin': latinName,
    'jumlah_ayat': totalAyah,
    'tempat_turun': nuzul,
    'arti': meaning,
    'deskripsi': desc,
    'audio': audio,

  };
}

enum Nuzul {
  // ignore: constant_identifier_names
  MADINAH,
  // ignore: constant_identifier_names
  MEKAH
}

final nuzulValues = EnumValues({
  'madinah' : Nuzul.MADINAH,
  'mekah' : Nuzul.MEKAH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse{
    reverseMap = map.map((key, value) => MapEntry(value, key));
    return reverseMap;
  }
}


