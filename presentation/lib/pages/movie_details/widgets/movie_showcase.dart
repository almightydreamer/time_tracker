import 'package:domain/modules/home/genres/entity/genre_entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/resources/custom_colors.dart';
import 'package:presentation/resources/text_styles.dart';

class MovieShowcase extends StatelessWidget {
  const MovieShowcase(
      {Key? key,
      required this.title,
      required this.releaseDate,
      required this.genres,
      this.runtime,
      this.overview,
      required this.voteAverage})
      : super(key: key);

  final String title;
  final String releaseDate;
  final List<GenreEntity> genres;
  final int? runtime;
  final String? overview;
  final num voteAverage;

  @override
  Widget build(BuildContext context) {

    String genresString = '';

    if (genres.length > 1) {
      for (var genre in genres) {
        genresString += genre.name;
        genresString += ' ';
      }
    } else {
      genresString = genres.first.name;
    }

    String duration = '${runtime! ~/ 60}h ${runtime! % 60}min';
    return Column(
      children: [
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.robotoCondensed48w700.copyWith(
            color: CustomColor.white,
          ),
        ),
        Text(
          '${releaseDate.substring(0, 4)} | $genresString| $duration',
          textAlign: TextAlign.center,
          style: TextStyles.robotoCondensed24w300.copyWith(color: CustomColor.white.withOpacity(0.7)),
        ),
        Row(
          children: [
            const Spacer(),
            Icon(
              Icons.star,
              color: (voteAverage > 0.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
            ),
            Icon(
              Icons.star,
              color: (voteAverage > 2.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
            ),
            Icon(
              Icons.star,
              color: (voteAverage > 4.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
            ),
            Icon(
              Icons.star,
              color: (voteAverage > 6.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
            ),
            Icon(
              Icons.star,
              color: (voteAverage > 8.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                voteAverage.toStringAsFixed(1),
                style: TextStyles.robotoCondensed14w700.copyWith(color: CustomColor.white),
              ),
            ),
            const Spacer(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            (overview != null) ? overview! : '',
            style: TextStyles.robotoCondensed18w300.copyWith(color: CustomColor.white.withOpacity(0.5)),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 20),
              child: Text(
                'Trailer',
                style: TextStyles.robotoCondensed18w700.copyWith(
                  color: CustomColor.yinmnBlue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}
