//
//  MoviePost.swift
//  FavoriteMovies
//
//  Created by Christella on 3/11/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class MoviePost: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    func setMovieImage(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.moviePosterImage = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.moviePosterImage!)!
        return img
    }
}
