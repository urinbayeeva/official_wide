import 'package:flutter/material.dart';
import 'package:wide/feature/home/view/widgets/selectable_container.dart';
import 'package:wide/feature/home/view_model/report_words.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: reportWords.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SelectableContainer(
              text: reportWords[index],
              index: index,
            ),
          );
        },
      ),
    );
  }
}
