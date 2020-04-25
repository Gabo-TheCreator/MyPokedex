//
//  HomeWebService.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit
import Alamofire

class HomeWebService: NSObject {
    
    func fetchPokemons (completion: @escaping(Pokemons?) -> ()) {
        let request = AF.request(Constants.API.Pokemons.pokemonsAPI)
        request.responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.data else {
                    completion(nil)
                    return
                }
                do {
                    let pokemons = try JSONDecoder().decode(Pokemons.self, from: data)
                    completion(pokemons)
                } catch let error as NSError {
                    print("fetchPokemons - JSON Decoder failed with error \(error.localizedDescription)")
                    completion(nil)
                }
                
            case .failure(let error):
                print("fetchPokemons - Alamofire request failed with error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    
    func fetchPokemonDetailsFrom(_ urlString:String, completion: @escaping(PokemonDetails?) -> ()) {
        let request = AF.request(urlString)
        request.responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.data else {
                    completion(nil)
                    return
                }
                do {
                    let pokemonDetails = try JSONDecoder().decode(PokemonDetails.self, from: data)
                    completion(pokemonDetails)
                } catch let error as NSError {
                    print("fetchPokemonDetailsFrom - JSON Decoder failed with error: \(error.localizedDescription)")
                    completion(nil)
                }
 
            case .failure(let error):
                print("fetchPokemonDetailsFrom - Alamofire request failer with error \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
