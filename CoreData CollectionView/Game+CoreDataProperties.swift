//
//  Game+CoreDataProperties.swift
//  CoreData CollectionView
//
//  Created by Matheus Lima Ferreira on 10/06/19.
//  Copyright © 2019 Matheus Lima Ferreira. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?

}
