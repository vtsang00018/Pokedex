//
//  PokedexVC.swift
//  Pokedex
//
//  Created by Vincent Tsang on 6/2/17.
//  Copyright © 2017 Vincent Tsang. All rights reserved.
//

import UIKit
import AVFoundation

class PokedexVC: UIViewController, UICollectionViewDelegate,
                        UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{

    @IBOutlet weak var myCollectionView: UICollectionView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemons: [Pokemon]!
    var filteredPokemons: [Pokemon]!
    
    var isSearchMode = false
    
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
       
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        pokemons = readPokeCSV(csvName: "pokemon", csvType: "csv")
        initMusic()
    }

    func initMusic(){
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isSearchMode{
            return filteredPokemons.count
        }
        
        return pokemons.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            let pokemon: Pokemon!
            
            if isSearchMode{
                pokemon = Pokemon(name: filteredPokemons[indexPath.row].name, pokemonID: filteredPokemons[indexPath.row].pokemonID)
            } else {
            
                pokemon = Pokemon(name: pokemons[indexPath.row].name, pokemonID: pokemons[indexPath.row].pokemonID)
            }
            cell.configureCell(pokemon)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlayer.isPlaying{
            musicPlayer.pause()
            sender.alpha = 0.4
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""{
            isSearchMode = false
            myCollectionView.reloadData()
            view.endEditing(true)
            
        } else {
            isSearchMode = true
            let lower = searchBar.text!.lowercased()
        
            filteredPokemons = pokemons.filter({
                $0.name.range(of: lower) != nil
            })
            
            myCollectionView.reloadData()
        }
    }
}

