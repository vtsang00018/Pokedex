//
//  PokeCell.swift
//  Pokedex
//
//  Created by Vincent Tsang on 6/2/17.
//  Copyright © 2017 Vincent Tsang. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbImg: UIImageView!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name
        thumbImg.image = UIImage.init(named: "\(self.pokemon.pokemonID)")
    }
}
