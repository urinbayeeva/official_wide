import 'package:wide/core/screens/all.dart';

enum Language { Ozbekcha, Ruscha, Inglizcha }

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  Language? _language;
  List<String> lang = ["O'zbekcha", "Русский", "English"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 148),
              const Text(
                "O'zingiz yaxshi biladigan\ntilni tanlang",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: Language.values.length,
                itemBuilder: (context, index) {
                  final language = Language.values[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _language = language;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(8),
                        border: _language == language ? Border.all(color: AppColors.c1a73e8, width: 1) : null,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(children: [
                        Radio<Language>(
                            splashRadius: 0.5,
                            value: language,
                            activeColor: AppColors.c1a73e8.withOpacity(0.8),
                            hoverColor: AppColors.c1a73e8.withOpacity(0.8),
                            focusColor: AppColors.c1a73e8.withOpacity(0.8),
                            overlayColor: MaterialStateProperty.all<Color>(AppColors.c1a73e8),
                            fillColor: MaterialStateProperty.all<Color>(AppColors.c1a73e8),
                            groupValue: _language,
                            onChanged: (Language? value) {
                              setState(() {
                                _language = value;
                              });
                            }),
                        Text(
                          lang[index],
                          style: const TextStyle(color: Color(0xFF1C1C1C), fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                  );
                },
              ),
              const Spacer(),
              Visibility(
                visible: _language != null,
                child: Column(
                  children: [
                    ButtonBlue(
                      width: double.infinity,
                      height: 53,
                      color: AppColors.c1a73e8,
                      text: "Kirish",
                      onPressed: () {
                        context.go("/login");
                      },
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
