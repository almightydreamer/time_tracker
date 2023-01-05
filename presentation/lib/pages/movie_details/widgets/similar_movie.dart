import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/modules/home/similar_movies/entity/similar_movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/resources/custom_colors.dart';
import 'package:presentation/resources/text_styles.dart';

class SimilarMovie extends StatelessWidget {
  const SimilarMovie({Key? key, required this.movie}) : super(key: key);

  final SimilarMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    String posterUrl = 'https://image.tmdb.org/t/p/w500/${movie.posterPath}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 122,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(imageUrl: posterUrl),
          ),
        ),
        Text(
          movie.title,
          textAlign: TextAlign.center,
          style: TextStyles.robotoCondensed15w400.copyWith(color: CustomColor.white.withOpacity(0.7)),
        )
      ],
    );
  }
}
