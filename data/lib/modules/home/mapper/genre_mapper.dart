import 'package:data/modules/home/dto/api/genre_api_dto.dart';
import 'package:domain/modules/home/genres/entity/genre_entity.dart';

class GenreMapper {
  GenreEntity mapApiToEntity(GenreApiDTO input) {
    return GenreEntity(id: input.id, name: input.name);
  }
}
