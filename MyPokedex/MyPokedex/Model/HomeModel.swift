//
//  HomeModel.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import Foundation

// MARK: - Pokemons
// Response form ~> https://pokeapi.co/api/v2/pokemon
class Pokemons: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]

    init(count: Int, next: String, previous: String?, results: [Pokemon]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

// MARK: - Pokemon
class Pokemon: Decodable {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}


// MARK: - PokemonDetails
// Response from ~> https://pokeapi.co/api/v2/pokemon/##
// MARK: - PokemonDetails
class PokemonDetails: Decodable {
    let abilities: [Ability]
    let forms: [Species]
    let id: Int
    let moves: [Move]
    let name: String
    let order: Int
    let species: Species
    let sprites: Sprites
    let types: [TypeElement]

    init(abilities: [Ability], forms: [Species], id: Int, moves: [Move], name: String, order: Int, species: Species, sprites: Sprites, types: [TypeElement]) {
        self.abilities = abilities
        self.forms = forms
        self.id = id
        self.moves = moves
        self.name = name
        self.order = order
        self.species = species
        self.sprites = sprites
        self.types = types
    }
}

// MARK: - Ability
class Ability: Decodable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }

    init(ability: Species, isHidden: Bool, slot: Int) {
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}

// MARK: - Species
class Species: Decodable {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

// MARK: - Move
class Move: Decodable {
    let move: Species

    init(move: Species) {
        self.move = move
    }
}

// MARK: - Sprites
class Sprites: Decodable {
    let backDefault, backShiny, frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    init(backDefault: String, backShiny: String, frontDefault: String, frontShiny: String) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}

// MARK: - TypeElement
class TypeElement: Decodable {
    let slot: Int
    let type: Species

    init(slot: Int, type: Species) {
        self.slot = slot
        self.type = type
    }
}
