//
//  ViewController.swift
//  CoreData CollectionView
//
//  Created by Matheus Lima Ferreira on 10/06/19.
//  Copyright © 2019 Matheus Lima Ferreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10","11","12", "13", "14", "15", "16", "17", "18", "19", "20","21","22", "23", "24", "25", "26", "27", "28"]
    
    let images = ["Ant", "Bear", "Brain", "Cat", "Croc", "Dinosaur_1", "Dog", "Dragon", "Fly", "Grandma", "Koala", "Monkey", "Mouse", "Ninja", "Panda_Paddle", "Pirahna", "RocketMouse", "Shark_Ship", "Snake", "Space_Marine", "Space_Monkey", "Space_Ship_1", "Space_Ship_2", "Space_Ship_3", "Wolf", "Yum_Fish","Zombie_2", "Zombie"]
    
    var games: [Game] = []
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapped(){
        let game = Game(context: PersistenceService.context)
        
        game.title = items.randomElement()
        game.image = images.randomElement()
        
        games.append(game)
        
        let indexPath = [IndexPath(item: games.count - 1, section: 0)]
        collectionView.insertItems(at: indexPath)
        
        
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        let game = games[indexPath.row]
        print(game.image)
        cell.imageView.image = UIImage(named: game.image ?? "Zombie")
        cell.titleLabel.text = game.title
        
        return cell
    }
    
   
}

