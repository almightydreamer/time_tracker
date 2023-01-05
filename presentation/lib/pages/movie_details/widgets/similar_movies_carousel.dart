import 'package:domain/modules/home/similar_movies/entity/similar_movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home/controllers/home_controller.dart';
import 'package:presentation/pages/movie_details/controllers/movie_details_controller.dart';
import 'package:presentation/pages/movie_details/widgets/similar_movie.dart';

import '../movie_details.dart';

class SimilarMoviesCarousel extends StatefulWidget {
  const SimilarMoviesCarousel({Key? key}) : super(key: key);

  @override
  State<SimilarMoviesCarousel> createState() => _SimilarMoviesCarouselState();
}

class _SimilarMoviesCarouselState extends State<SimilarMoviesCarousel> {
  @override
  Widget build(BuildContext context) {
    MovieDetailsController controller = Get.find();
    HomeController homeController = Get.find();
    return Obx(
      () => PageView.builder(
        allowImplicitScrolling: true,
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        controller: PageController(viewportFraction: 0.25),
        pageSnapping: true,
        padEnds: false,
        itemCount: controller.similarMovieList.length,
        itemBuilder: (context, index) {
          var item = controller.similarMovieList[index];
          return RawMaterialButton(
              onPressed: () async {
                var entity = await homeController.getDetails(item.id);
                if (!mounted) return;
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movieDetailsEntity: entity)));
              },child: SimilarMovie(movie: item));
        },
      ),
    );
  }
}
