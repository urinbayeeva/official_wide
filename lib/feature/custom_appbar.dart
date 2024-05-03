import 'package:wide/core/screens/all.dart';

Widget buildAppBar(BuildContext context, {Widget? contentWidget, bool showSearchIcon = false}) {
  return AppBar(
    surfaceTintColor: Colors.white,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AppImages.returnIcon,
            ),
          ),
          contentWidget!,
          showSearchIcon
              ? IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppImages.searchIcon),
                )
              : const SizedBox()
        ],
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xFFEFEFEF),
            ),
          ),
        ),
      ),
    ),
  );
}
