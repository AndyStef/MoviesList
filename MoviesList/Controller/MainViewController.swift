//
//  MainViewController.swift
//  MoviesList
//
//  Created by Andyy on 5/20/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateMovieDelegate, AddAndEditMovieDelegate{

    
    //MARK: - Outlets and variables
    @IBOutlet weak var tableView: UITableView!
    
    var dataModel : DataModel!
    
    //MARK: - Main mehods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rateSegue" {
            let destinationController = segue.destinationViewController as! RateViewController
            destinationController.delegate = self
            if let indexPath = tableView.indexPathForSelectedRow{
                destinationController.movieToRate = dataModel.movies[indexPath.row]
            }
        } else if segue.identifier == "addMovie" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! AddAndEditTableViewController
            controller.delegate = self
        } else if segue.identifier == "editMovie" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! AddAndEditTableViewController
            controller.delegate = self
            if let indexPath = tableView.indexPathForSelectedRow {
                controller.movieToEdit = dataModel.movies[indexPath.row]
            }
        } else if segue.identifier == "DetailSegue" {
            let destinationController = segue.destinationViewController as! DetailTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationController.movieToShow = dataModel.movies[indexPath.row]
            }
        }
    }

    //MARK: - TableView DataSource methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MovieTableViewCell
        cell.movieNameLabel.text = dataModel.movies[indexPath.row].name
        cell.movieRateLabel.text = String(dataModel.movies[indexPath.row].rating)
        cell.movieImage.image = UIImage(named: dataModel.movies[indexPath.row].image)
        return cell
    }
 
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //MARK: - TableVeiw Delegate methods
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Знести"
    }
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alertController = UIAlertController(title: self.dataModel.movies[indexPath.row].name, message: "", preferredStyle: .ActionSheet)
        let editAction = UIAlertAction(title: "Редагувати", style: .Default, handler: {(action) -> Void in
            self.performSegueWithIdentifier("editMovie", sender: nil)
        })
        let rateAction = UIAlertAction(title: "Оцінити", style: .Default) { (action)-> Void in
            self.performSegueWithIdentifier("rateSegue", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Відмінити", style: .Cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Видалити", style: .Destructive, handler: {(action) -> Void in
            self.dataModel.movies.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        let detailsAction = UIAlertAction(title: "Детальна інфа", style: .Default, handler: {(action) -> Void in
            self.performSegueWithIdentifier("DetailSegue", sender: nil)
        })
        let shareAction = UIAlertAction(title: "Поділитися", style: .Default, handler: nil)
        
        alertController.addAction(detailsAction)
        alertController.addAction(editAction)
        alertController.addAction(rateAction)
        alertController.addAction(shareAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
   
    //MARK: - Rate delegate
    func RateMovie(controller: RateViewController, movieToRate: Movie) {
        if let index = dataModel.movies.indexOf(movieToRate){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath){
                let customCell = cell as! MovieTableViewCell
                customCell.movieRateLabel.text = String(movieToRate.rating)
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Add and edit delegate
    func addMovie(controller: AddAndEditTableViewController, newItem: Movie) {
        let newRowIndex = dataModel.movies.count
        dataModel.movies.append(newItem)
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Bottom)
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func editMovie(controller: AddAndEditTableViewController, editedItem: Movie) {
        tableView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
























