import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/modules/home/genres/entity/genre_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/movie_details/controllers/movie_details_controller.dart';
import 'package:presentation/resources/custom_colors.dart';
import 'package:presentation/resources/text_styles.dart';

import 'movie_runtime_bar.dart';

class MovieExplicit extends StatelessWidget {
  const MovieExplicit({Key? key, required this.backdropPath, required this.title, required this.releaseDate, required this.genresList, this.runtime, this.overview, required this.voteAverage}) : super(key: key);

  final String? backdropPath;
  final String title;
  final String releaseDate;
  final List<GenreEntity> genresList;
  final int? runtime;
  final String? overview;
  final num voteAverage;

  @override
  Widget build(BuildContext context) {

    MovieDetailsController controller = Get.find();

    String backdropUrl = 'https://image.tmdb.org/t/p/w500/$backdropPath';
    String duration = '${runtime! ~/ 60}h ${runtime! % 60}min';

    String genres = '';

    if (genres.length > 1) {
      for (var genre in genresList) {
        genres += genre.name;
        genres += ' ';
      }
    } else {
      genres = genresList.first.name;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: (controller.alreadyAnimated.value) ? 1.0 : 0.0,
          child: SizedBox(
            height: 222,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Center(
                  child: CachedNetworkImage(
                      fadeInDuration: const Duration(seconds: 1),
                      imageUrl: backdropUrl,
                      fit: BoxFit.fitHeight,
                      placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          )),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Row(
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.skip_previous_rounded,
                            size: 40,
                            color: CustomColor.white.withOpacity(0.85),
                          ),
                          Center(
                            child: Icon(
                              Icons.play_circle_fill_rounded,
                              size: 60,
                              color: CustomColor.white.withOpacity(0.85),
                            ),
                          ),
                          Icon(
                            Icons.skip_next_rounded,
                            size: 40,
                            color: CustomColor.white.withOpacity(0.85),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(bottom: 10),
                        height: 82,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                            Colors.transparent,
                            Colors.black,
                          ]),
                        ),
                        child: Row(
                          children: [
                            const MovieRuntimeBar(),
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Icon(
                                Icons.fullscreen_rounded,
                                size: 10,
                                color: CustomColor.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 40),
          child: AnimatedOpacity(
            opacity: (controller.animate1.value) ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Text(
              title,
              style: TextStyles.robotoCondensed20w400.copyWith(color: CustomColor.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 40),
          child: AnimatedOpacity(
            opacity: (controller.animate2.value) ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Container(
              //width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: (voteAverage > 0.5)
                        ? CustomColor.pinardYellow
                        : CustomColor.white.withOpacity(0.5),
                  ),
                  Icon(
                    Icons.star,
                    color: (voteAverage > 2.5)
                        ? CustomColor.pinardYellow
                        : CustomColor.white.withOpacity(0.5),
                  ),
                  Icon(
                    Icons.star,
                    color: (voteAverage > 4.5)
                        ? CustomColor.pinardYellow
                        : CustomColor.white.withOpacity(0.5),
                  ),
                  Icon(
                    Icons.star,
                    color: (voteAverage > 6.5)
                        ? CustomColor.pinardYellow
                        : CustomColor.white.withOpacity(0.5),
                  ),
                  Icon(
                    Icons.star,
                    color: (voteAverage > 8.5)
                        ? CustomColor.pinardYellow
                        : CustomColor.white.withOpacity(0.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      voteAverage.toStringAsFixed(1),
                      style: TextStyles.robotoCondensed18w700.copyWith(color: CustomColor.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13, left: 40),
          child: AnimatedOpacity(
            opacity: (controller.animate3.value) ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Text(
              '${releaseDate.substring(0, 4)} | $genres| $duration',
              textAlign: TextAlign.center,
              style: TextStyles.robotoCondensed18w300.copyWith(color: CustomColor.white.withOpacity(0.7)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 40),
          child: AnimatedOpacity(
            opacity: (controller.animate4.value) ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                (overview != null) ? overview! : '',
                style: TextStyles.robotoCondensed18w300.copyWith(color: CustomColor.white.withOpacity(0.5)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
