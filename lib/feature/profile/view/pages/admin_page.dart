import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: buildAppBar(context,
            contentWidget: const Text(
              "Admin",
              style: TextStyle(
                color: AppColors.c1c1c1c,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            showSearchIcon: false),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: 24),
          const Center(
            child: Text(
              "Admin bilan bog'lanish uchun to'liq va kerakli sms  yuboring yoqsa sizning\nprofilingiz blok bolish mumkun  habaringiz 3 kunichida korib chiqiladi",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.c707071,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          // ignore: prefer_const_constructors
          Expanded(
              child: const SizedBox(
            width: 578,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Shikoyat yoki taklifingiz",
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.cb7b7b7),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB7B7B7)),
                ),
              ),
            ),
          )),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Habarni yuborish",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.c1a73e8),
            ),
          ),
          const SizedBox(height: 70)
        ],
      ),
    );
  }
}
