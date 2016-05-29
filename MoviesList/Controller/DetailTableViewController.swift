//
//  DetailTableViewController.swift
//  MoviesList
//
//  Created by Andyy on 5/29/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    //MARK: - Outlets and variables
    
    var movieToShow:Movie?
    
    //MARK: - Main Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 67
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath) as! MovieImageTableViewCell
        
        if let myImage = movieToShow?.image {
             imageCell.movieImage.image = UIImage(named: myImage)
        }
        
        let infoCell = tableView.dequeueReusableCellWithIdentifier("InfoCell", forIndexPath: indexPath) as! MovieInfoTableViewCell

        infoCell.valueLabel.text = "Some very long value that dont pass this too small cell(to make sure thats true)"
        
        switch indexPath.row {
        case 1:
            infoCell.fieldLabel.text = "Назва фільму"
            infoCell.valueLabel.text = movieToShow?.name
        case 2:
            infoCell.fieldLabel.text = "Продюсер"
            if let producer = movieToShow?.producer {
                infoCell.valueLabel.text = producer
            } else {
                infoCell.valueLabel.text = "А хз який продюсер"
            }
        case 3:
            infoCell.fieldLabel.text = "Технологія перегляду"
            infoCell.valueLabel.text = movieToShow?.technology
        case 4:
            infoCell.fieldLabel.text = "Ціна квитка"
            if let price = movieToShow?.price {
                infoCell.valueLabel.text = String(price)
            }
        case 5:
            infoCell.fieldLabel.text = "Рік випуску"
            if let year = movieToShow?.productionYear {
                infoCell.valueLabel.text = String(year)
            }
        default:
            print("do notjing ")
        }
        

        if indexPath.row == 0 {
            return imageCell
        } else {
            return infoCell
        }
       
    }
    
    // MARK: - Table view delegete
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
 
    }
