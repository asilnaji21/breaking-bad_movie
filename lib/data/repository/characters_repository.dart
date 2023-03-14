import '../model/characters.dart';
import '../web_services/character_webservice.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;
  CharactersRepository(this.characterWebServices);
  Future<List<Character>> getAllCharacter() async {
    final characters = await characterWebServices.getAllCharacter();
    return characters.map((char) => Character.fromJson(char)).toList();
  }
}
