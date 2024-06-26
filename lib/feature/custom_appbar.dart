import 'package:chatview/chatview.dart';
import 'package:wide/core/screens/all.dart';

Widget buildAppBar(BuildContext context,
    {Widget? contentWidget,
    bool showSearchIcon = false,
    VoidCallBack? function,
    VoidCallBack? returnFunction}) {
  return AppBar(
    surfaceTintColor: Colors.white,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(AppImages.returnIcon)),
          contentWidget!,
          showSearchIcon
              ? IconButton(
                  onPressed: function,
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
