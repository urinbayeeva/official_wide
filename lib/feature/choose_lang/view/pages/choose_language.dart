import 'package:wide/core/screens/all.dart';

// ignore: constant_identifier_names
enum Language { Ozbekcha, Ruscha, Inglizcha }

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  Language? _language;
  List<String> lang = ["O'zbekcha", "Русский", "English"];
  bool _buttonVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.230),
                      const Text("O'zingiz yaxshi biladigan\ntilni tanlang",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF1C1C1C),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: screenHeight * 0.200),
                      Column(
                        children: Language.values.map((language) {
                          final index = language.index;
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _language = language;
                                  _buttonVisible = true;
                                });
                              },
                              child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(8),
                                      border: _language == language
                                          ? Border.all(
                                              color: AppColors.c1a73e8,
                                              width: 1)
                                          : null),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: Row(children: [
                                    Radio<Language>(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.standard
                                          .copyWith(horizontal: 1, vertical: 1),
                                      splashRadius: 0.005,
                                      value: language,
                                      activeColor:
                                          AppColors.c1c1c1c.withOpacity(0.8),
                                      hoverColor:
                                          AppColors.c1c1c1c.withOpacity(0.8),
                                      fillColor:
                                          // ignore: deprecated_member_use
                                          MaterialStateProperty.all<Color>(
                                              AppColors.c1a73e8),
                                      groupValue: _language,
                                      onChanged: (Language? value) {
                                        setState(() {
                                          _language = value;
                                          _buttonVisible = true;
                                        });
                                      },
                                    ),
                                    Text(lang[index],
                                        style: const TextStyle(
                                            color: Color(0xFF1C1C1C),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600))
                                  ])));
                        }).toList(),
                      ),
                      const Spacer(),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: _buttonVisible ? 63 : 0,
                          child: Visibility(
                              visible: _buttonVisible,
                              child: Column(children: [
                                ButtonBlue(
                                  width: double.infinity,
                                  height: 48,
                                  color: AppColors.c1a73e8,
                                  text: "Kirish",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                ),
                                // _buttonVisible
                                //     ? const SizedBox(height: 10)
                                //     : const SizedBox.shrink()
                              ])))
                    ]))));
  }
}
