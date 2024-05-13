import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wide/core/screens/all.dart';
import 'package:wide/feature/home/view/widgets/images_listed.dart';
import 'package:wide/feature/recommendation/view/widgets/search_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;
  late List<SearchUserModel> users;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    users = allUser;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(AppImages.returnIcon),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF7F7F7),
                      ),
                      child: Center(
                        child: TextField(
                          onChanged: searchUser,
                          controller: searchController,
                          autocorrect: false,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search,
                                color: Colors.grey, size: 24),
                            hintStyle: TextStyle(
                              color: Color(0xFFB7B7B7),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 13.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/post/category.svg"),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3.0,
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      isThreeLine: true,
                      trailing: SvgPicture.asset("assets/icons/clear.svg",
                          width: 22, height: 22),
                      leading: Image.asset(user.imagePath!),
                      title: Text(
                        user.userName!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C1C1C),
                        ),
                      ),
                      subtitle: Text(
                        user.subtitle!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF707071),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void searchUser(String query) {
    final suggestions = allUser.where((user) {
      final userName = user.userName!.toLowerCase();
      final input = query.toLowerCase();

      return userName.contains(input);
    }).toList();

    setState(() {
      users = suggestions.cast<SearchUserModel>();
    });
  }
}
