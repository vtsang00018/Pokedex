//
//  Pokemon.swift
//  Pokedex
//
//  Created by Vincent Tsang on 6/2/17.
//  Copyright © 2017 Vincent Tsang. All rights reserved.
//

import Foundation

class Pokemon{

    var _name: String!
    var _pokemonID: Int!
    
    var name: String{
        return _name
    }
    
    var pokemonID: Int{
        return _pokemonID
    }
    
    init(name: String, pokemonID: Int) {
        self._name = name
        self._pokemonID = pokemonID
    }
}
