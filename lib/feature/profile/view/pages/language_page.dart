import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/custom_appbar.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<Language> languages = [
    Language(name: 'Uzbekistan', nameInLanguage: 'Uzbekcha'),
    Language(name: 'Russia', nameInLanguage: 'Russian'),
    Language(name: 'Turkiye', nameInLanguage: 'Turkish'),
    Language(name: 'England', nameInLanguage: 'English'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: buildAppBar(context, contentWidget: const SearchTextField(), showSearchIcon: false),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final language = languages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: CheckboxListTile(
              checkColor: AppColors.c1a73e8,
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              hoverColor: AppColors.c1a73e8,
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                language.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(
                language.nameInLanguage,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.cb7b7b7),
              ),
              value: language.selected,
              onChanged: (newValue) {
                setState(() {
                  language.selected = newValue ?? false;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              side: const BorderSide(
                color: AppColors.c1a73e8,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        },
      ),
    );
  }
}

class Language {
  final String name;
  final String nameInLanguage;
  bool selected;

  Language({required this.name, required this.nameInLanguage, this.selected = false});
}
