//
//  Game.swift
//  CoreData CollectionView
//
//  Created by Matheus Lima Ferreira on 10/06/19.
//  Copyright © 2019 Matheus Lima Ferreira. All rights reserved.
//

import Foundation
import UIKit
typealias GameTuple = (title: String, poster: Data?)

let globalGames: [GameTuple] = [GameTuple(title: "God of war 2", poster: UIImage(named: "god of war 2.png")?.pngData()), GameTuple(title: "God of war PS4", poster: UIImage(named: "god of war ps4.jpeg")?.pngData()), GameTuple(title: "Minecraft", poster: UIImage(named: "minecraft.jpeg")?.pngData()), GameTuple(title: "Resident Evil Biohazard", poster: UIImage(named: "resident eveil biohazard.jpeg")?.pngData()), GameTuple(title: "Shadow of the Colossus", poster: UIImage(named: "shadow of the colossus.jpeg")?.pngData()), GameTuple(title: "Star Wars: Battlefront", poster: UIImage(named: "star wars battlefront.jpeg")?.pngData())]
