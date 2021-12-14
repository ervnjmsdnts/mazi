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
                              child: Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  if (searchController
                                      .matchUsers[index]["ping"].value) ...[
                                    const Positioned(
                                      child: CustomToolTip(),
                                      top: -32,
                                    )
                                  ],
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor:
                                        const Color(AppColors.purply),
                                    child: IconButton(
                                      onPressed: () => searchController
                                              .matchUsers[index]["ping"].value
                                          ? searchController.matchUser(index)
                                          : searchController.pingUser(index),
                                      icon: const Icon(null),
                                    ),
                                  )
                                ],
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

class CustomToolTip extends StatelessWidget {
  const CustomToolTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(AppColors.accentPinky),
        ),
        child: const RegularText(
          textAlign: TextAlign.center,
          fontSize: 15,
          text: "Ping",
        ),
      ),
    );
  }
}
