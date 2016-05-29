//
//  PickerViewDelegates.swift
//  MoviesList
//
//  Created by Andyy on 5/22/16.
//  Copyright © 2016 Andyy. All rights reserved.
//


import UIKit

class yearPickerView: NSObject, UIPickerViewDelegate ,UIPickerViewDataSource{
    let yearAvailable = ["2014","2015","2016","2017","2018","2019"]
    
    var active:String = "2014"
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearAvailable.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return yearAvailable[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        active = yearAvailable[row]
    }
    
}

class technologyPickerViewDelegate: NSObject, UIPickerViewDelegate ,UIPickerViewDataSource{
    let techAvailable = ["2-D","3-D","4-DX"]
    
    var active:String = "2-D"
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return techAvailable.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return techAvailable[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        active = techAvailable[row]
    }
}