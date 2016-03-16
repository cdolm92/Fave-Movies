//
//  ViewController.swift
//  FavoriteMovies
//
//  Created by Christella on 3/5/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var moviePosts = [MoviePost]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
      
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchedRequest = NSFetchRequest(entityName: "MoviePost")
        
        do {
            let results = try context.executeFetchRequest(fetchedRequest)
            self.moviePosts = results as! [MoviePost]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
           
            let moviePost = moviePosts[indexPath.row]
            cell.configureCell(moviePost)

            return cell
        } else {
            return MovieCell()
        }
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviePosts.count
    }
    


}

