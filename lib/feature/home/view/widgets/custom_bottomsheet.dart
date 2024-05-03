import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/home/view/widgets/first_floor.dart';
import 'package:wide/feature/home/view/widgets/send_to_user.dart';

void showHorizontalBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: FirstFloor(),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.cefefef,
              ),
              const SizedBox(
                height: 24,
              ),
              const Expanded(
                flex: 1,
                child: SendToUser(),
              ),
              const SizedBox(
                height: 24,
              ),
              const Expanded(
                flex: 1,
                child: SendToUser(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
