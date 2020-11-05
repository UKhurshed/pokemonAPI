import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.gameIndices,
    this.heldItems,
    this.locationAreaEncounters,
    this.moves,
    this.species,
    this.sprites,
    this.stats,
    this.types,
  });

  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  List<Ability> abilities;
  List<Species> forms;
  List<GameIndex> gameIndices;
  List<HeldItem> heldItems;
  String locationAreaEncounters;
  List<Move> moves;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    name: json["name"],
    baseExperience: json["base_experience"],
    height: json["height"],
    isDefault: json["is_default"],
    order: json["order"],
    weight: json["weight"],
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
    gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
    heldItems: List<HeldItem>.from(json["held_items"].map((x) => HeldItem.fromJson(x))),
    locationAreaEncounters: json["location_area_encounters"],
    moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
    species: Species.fromJson(json["species"]),
    sprites: Sprites.fromJson(json["sprites"]),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "base_experience": baseExperience,
    "height": height,
    "is_default": isDefault,
    "order": order,
    "weight": weight,
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
    "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
    "held_items": List<dynamic>.from(heldItems.map((x) => x.toJson())),
    "location_area_encounters": locationAreaEncounters,
    "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
    "species": species.toJson(),
    "sprites": sprites.toJson(),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
  };
}

class Ability {
  Ability({
    this.isHidden,
    this.slot,
    this.ability,
  });

  bool isHidden;
  int slot;
  Species ability;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    isHidden: json["is_hidden"],
    slot: json["slot"],
    ability: Species.fromJson(json["ability"]),
  );

  Map<String, dynamic> toJson() => {
    "is_hidden": isHidden,
    "slot": slot,
    "ability": ability.toJson(),
  };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  int gameIndex;
  Species version;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
    gameIndex: json["game_index"],
    version: Species.fromJson(json["version"]),
  );

  Map<String, dynamic> toJson() => {
    "game_index": gameIndex,
    "version": version.toJson(),
  };
}

class HeldItem {
  HeldItem({
    this.item,
    this.versionDetails,
  });

  Species item;
  List<VersionDetail> versionDetails;

  factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
    item: Species.fromJson(json["item"]),
    versionDetails: List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "item": item.toJson(),
    "version_details": List<dynamic>.from(versionDetails.map((x) => x.toJson())),
  };
}

class VersionDetail {
  VersionDetail({
    this.rarity,
    this.version,
  });

  int rarity;
  Species version;

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
    rarity: json["rarity"],
    version: Species.fromJson(json["version"]),
  );

  Map<String, dynamic> toJson() => {
    "rarity": rarity,
    "version": version.toJson(),
  };
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  Species move;
  List<VersionGroupDetail> versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
    move: Species.fromJson(json["move"]),
    versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "move": move.toJson(),
    "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
  };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.versionGroup,
    this.moveLearnMethod,
  });

  int levelLearnedAt;
  Species versionGroup;
  Species moveLearnMethod;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
    levelLearnedAt: json["level_learned_at"],
    versionGroup: Species.fromJson(json["version_group"]),
    moveLearnMethod: Species.fromJson(json["move_learn_method"]),
  );

  Map<String, dynamic> toJson() => {
    "level_learned_at": levelLearnedAt,
    "version_group": versionGroup.toJson(),
    "move_learn_method": moveLearnMethod.toJson(),
  };
}

class Sprites {
  Sprites({
    this.backFemale,
    this.backShinyFemale,
    this.backDefault,
    this.frontFemale,
    this.frontShinyFemale,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.other,
    this.versions,
  });

  String backFemale;
  String backShinyFemale;
  String backDefault;
  String frontFemale;
  String frontShinyFemale;
  String backShiny;
  String frontDefault;
  String frontShiny;
  Other other;
  Versions versions;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    backFemale: json["back_female"],
    backShinyFemale: json["back_shiny_female"],
    backDefault: json["back_default"],
    frontFemale: json["front_female"],
    frontShinyFemale: json["front_shiny_female"],
    backShiny: json["back_shiny"],
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
    other: Other.fromJson(json["other"]),
    versions: Versions.fromJson(json["versions"]),
  );

  Map<String, dynamic> toJson() => {
    "back_female": backFemale,
    "back_shiny_female": backShinyFemale,
    "back_default": backDefault,
    "front_female": frontFemale,
    "front_shiny_female": frontShinyFemale,
    "back_shiny": backShiny,
    "front_default": frontDefault,
    "front_shiny": frontShiny,
    "other": other.toJson(),
    "versions": versions.toJson(),
  };
}

class Other {
  Other({
    this.dreamWorld,
    this.officialArtwork,
  });

  DreamWorld dreamWorld;
  DreamWorld officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromJson(json["dream_world"]),
    officialArtwork: DreamWorld.fromJson(json["official-artwork"]),
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld.toJson(),
    "official-artwork": officialArtwork.toJson(),
  };
}

class DreamWorld {
  DreamWorld();

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  GenerationI generationI;
  GenerationIi generationIi;
  GenerationIii generationIii;
  GenerationIv generationIv;
  GenerationV generationV;
  Map<String, DreamWorld> generationVi;
  GenerationVii generationVii;
  GenerationViii generationViii;

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
    generationI: GenerationI.fromJson(json["generation-i"]),
    generationIi: GenerationIi.fromJson(json["generation-ii"]),
    generationIii: GenerationIii.fromJson(json["generation-iii"]),
    generationIv: GenerationIv.fromJson(json["generation-iv"]),
    generationV: GenerationV.fromJson(json["generation-v"]),
    generationVi: Map.from(json["generation-vi"]).map((k, v) => MapEntry<String, DreamWorld>(k, DreamWorld.fromJson(v))),
    generationVii: GenerationVii.fromJson(json["generation-vii"]),
    generationViii: GenerationViii.fromJson(json["generation-viii"]),
  );

  Map<String, dynamic> toJson() => {
    "generation-i": generationI.toJson(),
    "generation-ii": generationIi.toJson(),
    "generation-iii": generationIii.toJson(),
    "generation-iv": generationIv.toJson(),
    "generation-v": generationV.toJson(),
    "generation-vi": Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "generation-vii": generationVii.toJson(),
    "generation-viii": generationViii.toJson(),
  };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  DreamWorld redBlue;
  DreamWorld yellow;

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
    redBlue: DreamWorld.fromJson(json["red-blue"]),
    yellow: DreamWorld.fromJson(json["yellow"]),
  );

  Map<String, dynamic> toJson() => {
    "red-blue": redBlue.toJson(),
    "yellow": yellow.toJson(),
  };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  DreamWorld crystal;
  DreamWorld gold;
  DreamWorld silver;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
    crystal: DreamWorld.fromJson(json["crystal"]),
    gold: DreamWorld.fromJson(json["gold"]),
    silver: DreamWorld.fromJson(json["silver"]),
  );

  Map<String, dynamic> toJson() => {
    "crystal": crystal.toJson(),
    "gold": gold.toJson(),
    "silver": silver.toJson(),
  };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  DreamWorld emerald;
  DreamWorld fireredLeafgreen;
  DreamWorld rubySapphire;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
    emerald: DreamWorld.fromJson(json["emerald"]),
    fireredLeafgreen: DreamWorld.fromJson(json["firered-leafgreen"]),
    rubySapphire: DreamWorld.fromJson(json["ruby-sapphire"]),
  );

  Map<String, dynamic> toJson() => {
    "emerald": emerald.toJson(),
    "firered-leafgreen": fireredLeafgreen.toJson(),
    "ruby-sapphire": rubySapphire.toJson(),
  };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  DreamWorld diamondPearl;
  DreamWorld heartgoldSoulsilver;
  DreamWorld platinum;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
    diamondPearl: DreamWorld.fromJson(json["diamond-pearl"]),
    heartgoldSoulsilver: DreamWorld.fromJson(json["heartgold-soulsilver"]),
    platinum: DreamWorld.fromJson(json["platinum"]),
  );

  Map<String, dynamic> toJson() => {
    "diamond-pearl": diamondPearl.toJson(),
    "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
    "platinum": platinum.toJson(),
  };
}

class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  DreamWorld blackWhite;

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
    blackWhite: DreamWorld.fromJson(json["black-white"]),
  );

  Map<String, dynamic> toJson() => {
    "black-white": blackWhite.toJson(),
  };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  DreamWorld icons;
  DreamWorld ultraSunUltraMoon;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
    icons: DreamWorld.fromJson(json["icons"]),
    ultraSunUltraMoon: DreamWorld.fromJson(json["ultra-sun-ultra-moon"]),
  );

  Map<String, dynamic> toJson() => {
    "icons": icons.toJson(),
    "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
  };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });

  DreamWorld icons;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
    icons: DreamWorld.fromJson(json["icons"]),
  );

  Map<String, dynamic> toJson() => {
    "icons": icons.toJson(),
  };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int baseStat;
  int effort;
  Species stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Species.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int slot;
  Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}