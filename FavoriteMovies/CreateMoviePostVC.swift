//
//  CreateMoviePostVC.swift
//  FavoriteMovies
//
//  Created by Christella on 3/11/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit
import CoreData

class CreateMoviePostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieImagePoster: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieReview: UITextField!
    @IBOutlet weak var imdbMovieLink: UITextField!
    @IBOutlet weak var saveMoviePostBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImagePoster.layer.cornerRadius = 4.0
        movieImagePoster.clipsToBounds = true
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImagePoster.image = image
    }
    
    @IBAction func addMoviePoster(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveMoviePostBtn(sender: AnyObject!) {
        if let title = movieTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("MoviePost", inManagedObjectContext: context)!
            let moviePost = MoviePost(entity: entity, insertIntoManagedObjectContext: context)
            moviePost.setMovieImage(movieImagePoster.image!)
            moviePost.title = movieTitle.text
            moviePost.review = movieReview.text
            moviePost.imdbLink = imdbMovieLink.text
            
            context.insertObject(moviePost)
            
            do {
                try context.save()
            } catch {
                print("Could not save movie post")
            }
            
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
   
    }
    
}
