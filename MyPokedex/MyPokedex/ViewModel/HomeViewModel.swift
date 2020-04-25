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
    var selectedPokemon: PokemonDetails?

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
                for (index, newPokemon) in unwrappedPokemons.results.enumerated() {
                    self.allPokemons?.append(newPokemon)
                    if index == unwrappedPokemons.results.count - 1 {
                        completion()
                    }
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
    
    func fetchNextPokemonsPage(completion: @escaping() -> ()) {
        let urlStr = self.pokemons?.next ?? ""
        let url = URL(string: urlStr)
        guard let unwrappedUrl = url else {
            completion()
            return
        }
        homeWebService.fetchNextPokemonsPage(unwrappedUrl) { (pokemons) in
            guard let unwrapperPokemons = pokemons else {
                completion()
                return
            }
            
            self.pokemons = unwrapperPokemons
            for (index, newPokemon) in unwrapperPokemons.results.enumerated() {
                self.allPokemons?.append(newPokemon)
                if index == unwrapperPokemons.results.count - 1 {
                    completion()
                }
            }
        }
    }
    
    func getImageURLStringFor(pokemonDetails: PokemonDetails) -> URL {
        let id = pokemonDetails.id
        let urlStr = String(format: Constants.API.imagesAPI, id)
        let url = URL(string: urlStr)
        return url!
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
