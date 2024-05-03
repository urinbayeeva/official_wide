import 'package:wide/core/screens/all.dart';

class PostGrid extends StatelessWidget {
  const PostGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> profileImages = [
      "assets/images/profile/lambo.png",
      "assets/images/profile/ferrari.png",
      "assets/images/profile/car.png",
      "assets/images/post/city.jpg",
      "assets/images/post/football.jpeg",
      "assets/images/post/mommy.png",
      "assets/images/post/people.webp",
      "assets/images/post/samarkand.webp"
    ];

    return ListView(
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[7], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[6], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[3], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[1], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
            Expanded(
                flex: 2,
                child: Container(
                  height: 250,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[0], context),
                )),
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: 250,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[4], context),
                )),
            const SizedBox(width: 2),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[3], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[2], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[1], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[0], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[4], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[3], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[2], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[1], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
            Expanded(
                flex: 2,
                child: Container(
                  height: 250,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[0], context),
                )),
          ],
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: 250,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[4], context),
                )),
            const SizedBox(width: 2),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[3], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[2], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[1], context),
                ),
                const SizedBox(height: 2),
                Container(
                  width: 150,
                  height: 125,
                  color: AppColors.cefefef,
                  child: _buildImage(profileImages[0], context),
                ),
              ],
            ),
            const SizedBox(width: 2),
          ],
        ),
      ],
    );
  }

  Widget _buildImage(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ZoomedImagePage(imagePath: imagePath),
          ),
        );
      },
      child: Hero(
        tag: imagePath,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ZoomedImagePage extends StatelessWidget {
  final String imagePath;

  const ZoomedImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
