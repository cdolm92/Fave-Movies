//
//  MoviePost+CoreDataProperties.swift
//  FavoriteMovies
//
//  Created by Christella on 3/11/16.
//  Copyright © 2016 Christella. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MoviePost {

    @NSManaged var moviePosterImage: NSData?
    @NSManaged var imdbLink: String?
    @NSManaged var review: String?
    @NSManaged var title: String?

}
