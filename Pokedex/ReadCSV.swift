//
//  ReadCSV.swift
//  Pokedex
//
//  Created by Vincent Tsang on 6/2/17.
//  Copyright © 2017 Vincent Tsang. All rights reserved.
//

import Foundation

func readPokeCSV(csvName: String, csvType: String) -> [Pokemon]{
    
    var pokemons = [Pokemon]()
    let path = Bundle.main.path(forResource: csvName, ofType: csvType)!
    
    do {
        let csv = try CSV(contentsOfURL: path)
        
        let rows = csv.rows
        
        for row in rows {
            let poke_id = Int(row["id"]!)!
            let poke_name = row["identifier"]!
            
            let pokemon = Pokemon(name: poke_name, pokemonID: poke_id)
            pokemons.append(pokemon)
        }
        return pokemons 
    } catch let err as NSError{
        print(err.debugDescription)
    }
    return pokemons
}
