//
//  Movie.swift
//  MoviesList
//
//  Created by Andyy on 5/20/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import Foundation

class Movie:NSObject,NSCoding {
    var name:String
    var productionYear:Int
    var producer:String = "Невідомий"
    var price:Int
    var image:String = "No image"
    var rating:Int = 0
    var technology:String = ""
    
    init(name:String,productionYear:Int,price:Int,producer:String?,image:String?,technology:String){
        self.name = name
        self.productionYear = productionYear
        if let _ = producer {
            self.producer = producer!
        }
        self.price = price
        if let _ = image{
            self.image = image!
        }
        self.technology = technology
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        productionYear = aDecoder.decodeIntegerForKey("Year")
        producer = aDecoder.decodeObjectForKey("Producer") as! String
        price = aDecoder.decodeIntegerForKey("Price")
        image = aDecoder.decodeObjectForKey("Image") as! String
        rating = aDecoder.decodeIntegerForKey("Rating")
        technology = aDecoder.decodeObjectForKey("Technology") as! String
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name,forKey: "Name")
        aCoder.encodeInteger(productionYear, forKey: "Year")
        aCoder.encodeObject(producer,forKey: "Producer")
        aCoder.encodeInteger(price, forKey: "Price")
        aCoder.encodeObject(image, forKey: "Image")
        aCoder.encodeInteger(rating, forKey: "Rating")
        aCoder.encodeObject(technology, forKey: "Technology")
    }
    
}
