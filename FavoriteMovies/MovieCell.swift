//
//  MovieCell.swift
//  FavoriteMovies
//
//  Created by Christella on 3/9/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReview: UILabel!
    @IBOutlet weak var movieLink: UILabel!
    @IBOutlet weak var cellBgImage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(moviePost: MoviePost) {

        
        movieImg.image = moviePost.getMovieImage()
        movieImg.layer.cornerRadius = 10.0
        movieImg.clipsToBounds = true
        movieTitle.text = moviePost.title
        movieReview.text = moviePost.review
        movieLink.text = moviePost.imdbLink
        cellBgImage.image = moviePost.getMovieImage()
        
    }

   

}
