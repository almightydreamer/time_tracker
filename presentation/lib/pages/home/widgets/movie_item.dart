import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/modules/home/movies/entity/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home/controllers/home_controller.dart';
import 'package:presentation/resources/custom_colors.dart';
import 'package:presentation/resources/text_styles.dart';

import '../../movie_details/movie_details.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({Key? key, required this.movie}) : super(key: key);

  final MovieEntity movie;

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  final String posterDefault =
      'https://media.istockphoto.com/id/1226615013/vector/film-strip-on-the-way-with-silhouette-of-cinema-projector-on-a-tripod-and-film-roll-cinema.jpg?s=612x612&w=0&k=20&c=vM6eopp99-JgNHuiBmBwHHLbBjh7_E6iDTb3QQCSFyU=';

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    String posterUrl = 'https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}';
    return RawMaterialButton(
      onPressed: () async {
        var entity = await controller.getDetails(widget.movie.id);
        if (!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movieDetailsEntity: entity)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
              height: 122,
              width: 82,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: posterUrl,
                    placeholder: (context, url) =>
                        Center(child: Container(width: 25, height: 25, child: CircularProgressIndicator())),
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 200,
                          child: Text(
                            widget.movie.title,
                            overflow: TextOverflow.clip,
                            style: TextStyles.robotoCondensed20w400.copyWith(color: CustomColor.white),
                          ),
                        ),
                        Spacer(),
                        Container(
                          //margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: CustomColor.white.withOpacity(0.05),
                          ),
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.bookmark,
                            size: 16,
                            color: CustomColor.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: (widget.movie.voteAverage > 0.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
                        ),
                        Icon(
                          Icons.star,
                          color: (widget.movie.voteAverage > 2.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
                        ),
                        Icon(
                          Icons.star,
                          color: (widget.movie.voteAverage > 4.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
                        ),
                        Icon(
                          Icons.star,
                          color: (widget.movie.voteAverage > 6.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
                        ),
                        Icon(
                          Icons.star,
                          color: (widget.movie.voteAverage > 8.5) ? CustomColor.pinardYellow : CustomColor.white.withOpacity(0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            widget.movie.voteAverage.toString(),
                            style: TextStyles.robotoCondensed14w700.copyWith(color: CustomColor.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '2019 | 3h 17 min',
                    style: TextStyles.robotoCondensed14w300.copyWith(color: CustomColor.white.withOpacity(0.7)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: CustomColor.strawberryPop.withOpacity(0.8),
                                offset: const Offset(0, 0),
                                spreadRadius: 3,
                                blurRadius: 10)
                          ]),
                          //margin: const EdgeInsets.only(top: 15),
                          width: 107,
                          height: 26,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
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
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                              color: CustomColor.white.withOpacity(0.1),
                              child: Text(
                                ' Trailer ',
                                style: TextStyles.robotoCondensed14w700.copyWith(color: CustomColor.yinmnBlue),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
