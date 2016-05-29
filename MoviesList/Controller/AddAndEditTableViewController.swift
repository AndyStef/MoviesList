//
//  AddAndEditTableViewController.swift
//  MoviesList
//
//  Created by Andyy on 5/22/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import UIKit

//MARK: - Protocol
protocol AddAndEditMovieDelegate:class {
    func addMovie(controller:AddAndEditTableViewController,newItem:Movie)
    func editMovie(controller:AddAndEditTableViewController,editedItem:Movie)
}

class AddAndEditTableViewController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    //MARK: - Outlets and variables
    //MARK: ---UI-ні елементи
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var producerTextField: UITextField!
    
    @IBOutlet weak var yearPickerViewOut: UIPickerView!
    
    @IBOutlet weak var technologyPickerView: UIPickerView!
    
    //MARK: ---Делегати
    weak var delegate:AddAndEditMovieDelegate?
    
    let yearDelegate = yearPickerView()
    
    let techDelegate = technologyPickerViewDelegate()
    
    var movieToEdit:Movie?

    //MARK: - Main methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //встановлення значень при Edit
        if let item = movieToEdit {
            self.doneButton.title = "Зберегти"
            title = "Редагування"
            nameTextField.text = item.name
            producerTextField.text = item.producer
            priceTextField.text = String(item.price)
            movieImage.image = UIImage(named: item.image)
        } else {
            nameTextField.becomeFirstResponder()
        }
        
        //панелька для цифрової клави
        let myFrame = CGRect(x: 0, y: 0, width: 320, height: 30)
        let numberToolbar = UIToolbar(frame: myFrame)
        numberToolbar.barStyle = .Default
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(AddAndEditTableViewController.doneWithNumberPad))
        let cancelButton2 = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(AddAndEditTableViewController.cancelNumberPad))
        let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        numberToolbar.items = [cancelButton2,space,doneButton]
        priceTextField.inputAccessoryView = numberToolbar
        
        //кнопка відміни на панелях
        let cancelToolbar = UIToolbar(frame: myFrame)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(AddAndEditTableViewController.cancelNumberPad))
        cancelToolbar.barStyle = .Default
        cancelToolbar.items = [cancelButton]
        nameTextField.inputAccessoryView = cancelToolbar
        producerTextField.inputAccessoryView = cancelToolbar
        
        //пікери
        yearPickerViewOut.delegate = yearDelegate
        yearPickerViewOut.dataSource = yearDelegate
        technologyPickerView.delegate = techDelegate
        technologyPickerView.dataSource = techDelegate
    }
    
    //MARK: -For delegate
    @IBAction func cancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneAction(sender: AnyObject) {
        if nameTextField.text == "" {
            let alertController = UIAlertController(title: "Обана!", message: "Ти ж ім'я не написав", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "ОК", style: .Default, handler: {(action) -> Void in
                self.nameTextField.becomeFirstResponder()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if priceTextField.text == "" {
            let alertController = UIAlertController(title: "Обана!", message: "Ти ж ціну не написав", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "ОК", style: .Default, handler: {(action) -> Void in
                self.priceTextField.becomeFirstResponder()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        if let item = movieToEdit {
            item.name = nameTextField.text!
            if producerTextField.text != "" {
                item.producer = producerTextField.text!
            }
            item.price = Int(priceTextField.text!)!
            item.productionYear = Int(yearDelegate.active)!
            item.technology = techDelegate.active
            delegate?.editMovie(self, editedItem: item)
        } else {
            let newMovie = Movie(name: "No name", productionYear: 2016, price: 0, producer: "No producer", image: nil, technology: "No technology")
            newMovie.name = nameTextField.text!
            if producerTextField.text != "" {
                newMovie.producer = producerTextField.text!
            }
            newMovie.price = Int(priceTextField.text!)!
            newMovie.productionYear = Int(yearDelegate.active)!
            newMovie.technology = techDelegate.active
            delegate?.addMovie(self, newItem: newMovie)
        }
        
        
    }
    
    //MARK: - Keyboard methods
    func doneWithNumberPad() {
        if priceTextField.text != "" {
            priceTextField.resignFirstResponder()
        } else {
            let alert = UIAlertController(title: "Ойй!", message: "Введіть ціну!!!!!", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func cancelNumberPad() {
        nameTextField.resignFirstResponder()
        producerTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField === nameTextField {
            producerTextField.becomeFirstResponder()
        } else if textField === producerTextField {
            priceTextField.becomeFirstResponder()
        }
        return true
    }
    
    //MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        } else {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    //MARK: - image picker delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        movieImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        movieImage.contentMode = UIViewContentMode.ScaleAspectFill
        movieImage.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
