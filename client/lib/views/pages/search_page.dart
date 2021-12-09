import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_images.dart';
import 'package:mazi/controllers/search_controller.dart';
import 'package:mazi/views/widgets/custom_texts.dart';
import 'package:mazi/views/widgets/custom_wave.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController searchController =
      Get.put<SearchController>(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: <Widget>[
                const Image(
                  width: 75,
                  image: AssetImage(AppImages.logo),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      const SizedBox(
                        width: 500,
                        height: 500,
                        child: WaterRipple(),
                      ),
                      const CircleAvatar(
                        radius: 48,
                        backgroundColor: Color(AppColors.accentPinky),
                        child: Icon(
                          Icons.person,
                          size: 48,
                        ),
                      ),
                      Obx(
                        () => StaggeredGridView.count(
                          crossAxisCount: 4,
                          children: List.generate(
                            searchController.matchUsers.length,
                            (index) => Center(
                              child: CircleAvatar(
                                radius: 12,
                                child: IconButton(
                                  onPressed: () =>
                                      searchController.matchUser(index),
                                  icon: const Icon(null),
                                ),
                              ),
                            ),
                          ),
                          staggeredTiles: const [
                            StaggeredTile.count(2, 2),
                            StaggeredTile.count(2, 1),
                            StaggeredTile.count(1, 2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const LightText(
                  text: "Searching . . .",
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
