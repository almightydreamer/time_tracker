import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/modules/home/movie_details/entity/movie_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/movie_details/widgets/movie_explicit.dart';
import 'package:presentation/pages/movie_details/widgets/movie_showcase.dart';
import 'package:presentation/resources/text_styles.dart';
import '../../resources/custom_colors.dart';
import 'controllers/movie_details_controller.dart';
import 'widgets/similar_movies_carousel.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key, required this.movieDetailsEntity}) : super(key: key);

  final MovieDetailsEntity movieDetailsEntity;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    Get.put(MovieDetailsController());
    MovieDetailsController controller = Get.find();
    controller.getSimilarMovies(widget.movieDetailsEntity.id);
    //var fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    scrollController.addListener(_onScrollEvent);
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MovieDetailsController controller = Get.find();

    controller.maxPixels = MediaQuery.of(context).size.height;

    String posterUrl = 'https://image.tmdb.org/t/p/w500/${widget.movieDetailsEntity.posterPath}';

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            CachedNetworkImage(
              imageUrl: posterUrl,
              placeholder: (context, url) =>
                  const Center(child: SizedBox(width: 25, height: 25, child: CircularProgressIndicator())),
              fit: BoxFit.fill,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [
                  0.1,
                  0.2,
                  0.5,
                ], colors: [
                  CustomColor.navalNight.withOpacity(0.0 + 0.99 * controller.animationCoefficient.value),
                  CustomColor.navalNight.withOpacity(0.5 * 2 * controller.animationCoefficient.value),
                  CustomColor.navalNight,
                ]),
              ),
            ),
            (controller.animationCoefficient.value < 0.8)
                ? Opacity(
                    opacity: 1 - controller.animationCoefficient.value,
                    child: MovieShowcase(
                      title: widget.movieDetailsEntity.title,
                      releaseDate: widget.movieDetailsEntity.releaseDate,
                      genres: widget.movieDetailsEntity.genres,
                      voteAverage: widget.movieDetailsEntity.voteAverage,
                      runtime: widget.movieDetailsEntity.runtime,
                      overview: widget.movieDetailsEntity.overview,
                    ),
                  )
                : Container(),
            (controller.animationCoefficient > 0.8)
                ? Positioned(
                    top: 0,
                    child: MovieExplicit(
                      title: widget.movieDetailsEntity.title,
                      releaseDate: widget.movieDetailsEntity.releaseDate,
                      genresList: widget.movieDetailsEntity.genres,
                      voteAverage: widget.movieDetailsEntity.voteAverage,
                      runtime: widget.movieDetailsEntity.runtime,
                      overview: widget.movieDetailsEntity.overview,
                      backdropPath: widget.movieDetailsEntity.backdropPath,
                    ))
                : Container(),
            ListView(
              physics: const PageScrollPhysics(),
              controller: scrollController,
              children: [
                Container(
                  //color: Colors.orange.withOpacity(0.3),
                  height: (MediaQuery.of(context).size.height),
                ),
                Container(
                  //color: Colors.purple.withOpacity(0.3),
                  height: (MediaQuery.of(context).size.height),
                ),
              ],
            ),
            (controller.animationCoefficient > 0.9)
                ? Positioned(
                    bottom: 100,
                    child: AnimatedOpacity(
                        opacity: (controller.animate5.value) ? 1.0 : 0.0,
                        duration: const Duration(seconds: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 16, left: 40),
                              width: MediaQuery.of(context).size.width - 50,
                              child: Text(
                                'Up Next',
                                style: TextStyles.robotoCondensed24w700.copyWith(color: CustomColor.white),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 180,
                                child: const SimilarMoviesCarousel()),
                          ],
                        )),
                  )
                : Container(),
            Column(
              children: [
                const Spacer(),
                Row(children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: CustomColor.white.withOpacity(0.2),
                            offset: const Offset(0, 0),
                            spreadRadius: 1,
                            blurRadius: 20)
                      ],
                    ),
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        width: 56,
                        height: 56,
                        color: CustomColor.white.withOpacity(0.2),
                        child: Center(
                          child: Icon(
                            Icons.bookmark,
                            color: CustomColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: CustomColor.strawberryPop.withOpacity(0.8),
                            offset: const Offset(0, 0),
                            spreadRadius: 1,
                            blurRadius: 20)
                      ],
                    ),
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: 230,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [CustomColor.strawberryPop, CustomColor.strawberryPop.withOpacity(0.8)]),
                        ),
                        child: Center(
                          child: Text(
                            'Watch Now',
                            style: TextStyles.robotoCondensed14w700.copyWith(color: CustomColor.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 34)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onScrollEvent() {
    MovieDetailsController controller = Get.find();
    if (controller.animationCoefficient > 0.8) {
      if (!controller.alreadyAnimated.value) {
        animationController.forward();
        print('transition animation');
      }
      controller.alreadyAnimated.value = true;
      controller.waterfallAnimation();
    } else {
      controller.resetAnimation();
    }
    controller.animationCoefficient.value = scrollController.position.pixels / controller.maxPixels;
    if (controller.animationCoefficient.value > 1) {
      controller.animationCoefficient.value = 1;
    }
    print(
        'coef ${controller.animationCoefficient} || maxpixels ${controller.maxPixels} || position ${scrollController.position.pixels}');
  }
}
