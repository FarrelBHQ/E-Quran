class Ayat {
    int id;
    int surah;
    int nomor;
    String ar;
    String tr;
    String idn;
  
    

    Ayat({
        required this.id,
        required this.surah,
        required this.nomor,
        required this.ar,
        required this.tr,
        required this.idn,
        
        
    });

    factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
        
        
    );
}