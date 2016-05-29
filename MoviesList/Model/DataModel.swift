//
//  DataModel.swift
//  MoviesList
//
//  Created by Andyy on 5/20/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import Foundation

class DataModel {
    var movies = [Movie]()
    
    init() {
        loadMovies()
        registerDefaults()
        handleFirstTime()
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    func dataFilePath()->String {
        return (documentsDirectory() as NSString).stringByAppendingPathComponent("Movies.plist")
    }
    
    func saveMovies() {
        let data = NSMutableData()
        let archiever = NSKeyedArchiver(forWritingWithMutableData: data)
        archiever.encodeObject(movies, forKey: "Movies")
        archiever.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadMovies() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiever = NSKeyedUnarchiver(forReadingWithData: data)
                movies = unarchiever.decodeObjectForKey("Movies") as! [Movie]
                unarchiever.finishDecoding()
            }
        }
    }
    
    func registerDefaults() {
        let dictionary = ["FirstTime":true]
        NSUserDefaults.standardUserDefaults().registerDefaults(dictionary)
    }
    
    func handleFirstTime() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let firstTime = userDefaults.boolForKey("FirstTime")
        if firstTime {
            for obj in readyMovies {
                movies.append(obj)
            }
            userDefaults.setBool(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
        
    }
}