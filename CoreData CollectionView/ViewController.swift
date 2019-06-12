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
    
    var games: [Game] = []
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        
        
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
        
//         let persistentContainer = PersistenceService.persistentContainer
        let fetchRequest = NSFetchRequest<Game>(entityName: "\(Game.self)")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        guard let games = try? PersistenceService.persistentContainer.viewContext.fetch(fetchRequest) else {return }
        
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

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

         let game = games[indexPath.row]
        var image = UIImage(data: (game.poster! as Data ))
        
        return image!.size
//        return CGSize(width: collectionView.frame.width * 0.4, height: collectionView.frame.height * 0.6)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    
}

