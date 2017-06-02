//
//  PokedexVC.swift
//  Pokedex
//
//  Created by Vincent Tsang on 6/2/17.
//  Copyright © 2017 Vincent Tsang. All rights reserved.
//

import UIKit


class PokedexVC: UIViewController, UICollectionViewDelegate,
                        UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            var pokemon = Pokemon(name: "Pokemon", pokemonID: indexPath.row+1)
            cell.configureCell(pokemon: pokemon)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}

