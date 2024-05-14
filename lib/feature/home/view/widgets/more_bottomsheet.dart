import 'package:wide/core/screens/all.dart';

void moreBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(children: [
            Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(
                                "assets/icons/home/bottomsheet_cancel.svg")),
                        Container(
                            width: 41,
                            height: 4,
                            decoration: BoxDecoration(
                                color: const Color(0xFFEFEFEF),
                                borderRadius: BorderRadius.circular(27))),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                "assets/icons/profile/bluesave.png",
                                width: 48,
                                height: 48))
                      ]),
                  const SizedBox(height: 24),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/home/report.svg"),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportPage())),
                          child: const Text(" Shikoyat",
                              style: TextStyle(
                                  color: AppColors.c1c1c1c,
                                  fontWeight: FontWeight.w500)),
                        )
                      ]),
                  const SizedBox(height: 24),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Qiziqarli",
                          style: TextStyle(
                              color: AppColors.c1c1c1c,
                              fontWeight: FontWeight.w500)))
                ]))
          ]));
    },
  );
}
