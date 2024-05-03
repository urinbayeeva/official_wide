import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/home/view/widgets/reels_text.dart';

class ReelsWidget extends StatelessWidget {
  const ReelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: 100,
        itemBuilder: (
          context,
          index,
        ) {
          return RotatedBox(
            quarterTurns: 1,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Center(
                    child: Image(
                      image: NetworkImage(
                          "https://wallpapers-clan.com/wp-content/uploads/2023/11/landscape-horizon-zero-dawn-desktop-wallpaper-preview.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                        onPressed: () {
                          moreBottomSheet(context);
                        },
                        icon: SvgPicture.asset("assets/icons/post/more_icon.svg"))),
                ReelsText(
                    fullText:
                        """At vero eos et accusamus et iusto odio dignissimos ducimus Havo sovishi munosabati bilan, butun respublika bo‘ylab metan-shoxobchalar soat 6:00 dan 15:00 gacha ishlashga o‘tdi. Energetika vazirligi buning uchun uzr so‘radi va aholini vaziyat barqarorlashgunga qadar tejamkor bo‘lishga chaqirdi.
bo‘ylab metan-shoxobchalar soat 6:00 dan 15:00 """)
              ],
            ),
          );
        },
      ),
    );
  }
}
