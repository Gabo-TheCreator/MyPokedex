//
//  HomeViewModel.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    
    @IBOutlet private var homeWebService: HomeWebService!
    private var pokemons: Pokemons?
    private var allPokemons: [Pokemon]?
    var allPokemonsDetails: [PokemonDetails] = []

    func fetchPokemons(completion: @escaping() -> ()) {
        homeWebService.fetchPokemons { (pokemons) in
            guard let unwrappedPokemons = pokemons else {
                completion()
                return
            }
            
            self.pokemons = unwrappedPokemons
            if self.allPokemons == nil {
                self.allPokemons = unwrappedPokemons.results
                completion()
            } else {
                for newPokemon in unwrappedPokemons.results {
                    self.allPokemons?.append(newPokemon)
                    completion()
                }
            }
        }
    }
    
    func fetchPokemonDetails(completion: @escaping() -> ()) {
        guard let allPokemonsUnwrapped = allPokemons else {
            completion()
            return
        }
        
        for (index, thisPokemon) in allPokemonsUnwrapped.enumerated() {
            let url = thisPokemon.url
            homeWebService.fetchPokemonDetailsFrom(url) { (pokemonDetails) in
                guard let unwrappedPokemonDetails = pokemonDetails else {
                    return
                }
                self.allPokemonsDetails.append(unwrappedPokemonDetails)
                
                if index == allPokemonsUnwrapped.count - 1 {
                    completion()
                }
            }
        }
    }
    
    func displayPokemons(completion: @escaping() -> ()) {
        fetchPokemons {
            self.fetchPokemonDetails {
                completion()
            }
        }
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        return self.allPokemonsDetails.count
    }
    
    func retrivePrimaryType (_ pokemonDetails: PokemonDetails) -> TypeElement? {
        for type in pokemonDetails.types {
            if type.slot == 1 {
                return type
            }
        }
        
        return nil
    }
    
    func retriveSecondaryType (_ pokemonDetails: PokemonDetails) -> TypeElement? {
        for type in pokemonDetails.types {
            if type.slot == 2 {
                return type
            }
        }
        
        return nil
    }
    
}
