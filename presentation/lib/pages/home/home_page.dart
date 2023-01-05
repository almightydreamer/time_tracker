import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home/widgets/movie_item.dart';
import 'package:presentation/resources/custom_colors.dart';
import 'package:presentation/resources/text_styles.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    //TabController tabController = TabController(length: controller.tabs.value.length, vsync: this);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 46),
                  child: Icon(
                    Icons.list,
                    color: CustomColor.white,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 46),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: CustomColor.white,
                      prefixIcon: Icon(
                        Icons.search,
                        color: CustomColor.white.withOpacity(0.7),
                      ),
                      suffixIcon: Icon(
                        Icons.tune,
                        color: CustomColor.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28),
              child: Obx(
                () => DefaultTabController(
                  length: controller.tabs.value.length,
                  child: TabBar(
                    indicatorColor: CustomColor.white,
                    labelStyle: TextStyles.robotoCondensed24w700,
                    labelColor: CustomColor.strawberryPop,
                    unselectedLabelColor: CustomColor.white.withOpacity(0.5),
                    indicatorPadding: EdgeInsets.zero,
                    isScrollable: true,
                    onTap: (value) {
                      print('new tab');
                      controller.selectedIndex.value = value;
                      var id = controller.genreEntities.keys.toList()[value];
                      controller.movieList.clear();
                      controller.getMovies([id]);
                    },
                    //controller: tabController,
                    tabs: controller.tabs.value.toList(),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 33),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 4, color: CustomColor.white),
                      insets: const EdgeInsets.symmetric(horizontal: 28),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Obx(
                  () => ListView.separated(
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, stops: const [
                          0.1,
                          0.4,
                          0.6,
                          0.9
                        ], colors: [
                          Colors.black.withOpacity(0.2),
                          CustomColor.white.withOpacity(0.2),
                          CustomColor.white.withOpacity(0.2),
                          Colors.black.withOpacity(0.2)
                        ]),
                      ),
                    ),
                    itemCount: controller.movieList.length,
                    itemBuilder: (context, index) {
                      return MovieItem(movie: controller.movieList[index]);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
