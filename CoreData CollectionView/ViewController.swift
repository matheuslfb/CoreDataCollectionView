//
//  ViewController.swift
//  CoreData CollectionView
//
//  Created by Matheus Lima Ferreira on 10/06/19.
//  Copyright © 2019 Matheus Lima Ferreira. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    let items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10","11","12", "13", "14", "15", "16", "17", "18", "19", "20","21","22", "23", "24", "25", "26", "27", "28"]
    
    let images = ["Ant", "Bear", "Brain", "Cat", "Croc", "Dinosaur_1", "Dog", "Dragon", "Fly", "Grandma", "Koala", "Monkey", "Mouse", "Ninja", "Panda_Paddle", "Pirahna", "RocketMouse", "Shark_Ship", "Snake", "Space_Marine", "Space_Monkey", "Space_Ship_1", "Space_Ship_2", "Space_Ship_3", "Wolf", "Yum_Fish","Zombie_2", "Zombie"]
    
    var games: [Game] = []
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func fetchGames(){
        
    }

    @IBAction func onTapped(){
        let game = Game(context: PersistenceService.context)
        
        guard let randomGame = globalGames.randomElement() else {return}
        
        game.title = randomGame.title
        game.poster = randomGame.poster as NSData?
        
        games.append(game)
        
        let indexPath = [IndexPath(item: games.count - 1, section: 0)]
        collectionView.insertItems(at: indexPath)
        
        
    }
    
    private func fetchData() {
        
         let persistentContainer = PersistenceService.persistentContainer 
        let fetchRequest = NSFetchRequest<Game>(entityName: "\(Game.self)")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        guard let games = try? persistentContainer.viewContext.fetch(fetchRequest) else {return }
        
        self.games.append(contentsOf: games)
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        let game = games[indexPath.row]
        
        
        cell.imageView.image = UIImage(data: (game.poster! as Data ))
        cell.titleLabel.text = game.title
        
        return cell
    }
    
   
}

