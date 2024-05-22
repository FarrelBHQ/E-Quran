import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/model/surah.dart';
import 'package:quran/ui/detail_screen.dart';
import 'package:quran/globals.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getLishSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getLishSurah(),
        initialData: const [],
        builder: ((context, snapshot) {
          return ListView.separated(
              itemBuilder: ((context, index) => _surahItem(
                  context: context, surah: snapshot.data!.elementAt(index))),
              separatorBuilder: (context, index) =>
                  Divider(color: const Color(0xFFAAAAAA).withOpacity(0.1)),
              itemCount: snapshot.data!.length);
        }));
  }

  Widget _surahItem({required BuildContext context, required Surah surah}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => DetailScreen(surahNumber: surah.number,))));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svg/nomor_surah.svg'),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: Text(
                      surah.number.toString(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  surah.latinName.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                // Text(surah.tempatTurun.nama)
                Text(
                  surah.nuzul.toString().toUpperCase(),
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: secondary),
                ),
                const SizedBox(width: 5,),
                SvgPicture.asset('assets/svg/dot.svg'),
                const SizedBox(width: 5,),
                Text(
                    '${surah.totalAyah} Ayat',
                    style: GoogleFonts.poppins(
                        color: secondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                    )
                ),
              ],
            ))
          ]),
        ),
      );
}
