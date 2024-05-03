import 'package:wide/core/screens/all.dart';

class ShowDeletingItem extends StatefulWidget {
  final String? giveText;
  final String? deleteText;
  const ShowDeletingItem({super.key, this.giveText, this.deleteText});

  @override
  State<ShowDeletingItem> createState() => _ShowDeletingItemState();
}

class _ShowDeletingItemState extends State<ShowDeletingItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.white,
              title: Center(
                child: Text(
                  widget.giveText!,
                  style: const TextStyle(color: AppColors.c1c1c1c, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              content: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "At vero eos et accusamus et iusto odio\ndignissimos ducimus qui blanditiis praesentium\nvoluptatum deleniti atque corrupti quos dolor ",
                      style: TextStyle(color: AppColors.c707071, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 48),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: Color(0xFFCFCFD0)),
                              top: BorderSide(width: 1, color: Color(0xFFCFCFD0)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.deleteText;
                              Navigator.pop(context);
                            });
                          },
                          child: const Center(
                            child: Text(
                              "O'chirish",
                              style: TextStyle(color: AppColors.c1a73e8, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: AppColors.cefefef),
                              top: BorderSide(width: 1, color: AppColors.cefefef))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            "Ortga qaytish",
                            style: TextStyle(color: AppColors.c1c1c1c, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Image.asset(
        "assets/icons/home/red_circle.png",
        width: 20,
        height: 20,
      ),
    );
  }
}
