//
//  RateViewController.swift
//  MoviesList
//
//  Created by Andyy on 5/20/16.
//  Copyright © 2016 Andyy. All rights reserved.
//

import UIKit


protocol RateMovieDelegate:class {
    func RateMovie(controller:RateViewController,movieToRate:Movie)
}

class RateViewController: UIViewController {
    
    //MARK: - Outlets and variables
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieRateLabel: UILabel!
    
    @IBOutlet weak var one: UIButton!
    
    @IBOutlet weak var two: UIButton!
    
    @IBOutlet weak var three: UIButton!
    
    @IBOutlet weak var four: UIButton!
    
    @IBOutlet weak var five: UIButton!
    
    weak var delegate:RateMovieDelegate?
    
    var movieToRate:Movie?
    
    var rate:Int?

    //MARK: - Main mehods
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "123")
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
        movieRateLabel.text = ""
        if let movie = movieToRate {
            movieNameLabel.text = movie.name
            switch movie.rating {
            case 1:
                movieRateLabel.text = "Фуфло"
                one.tintColor = UIColor.yellowColor()
                two.tintColor = UIColor.blueColor()
                three.tintColor = UIColor.blueColor()
                four.tintColor = UIColor.blueColor()
                five.tintColor = UIColor.blueColor()
            case 2:
                movieRateLabel.text = "Ну такоє"
                one.tintColor = UIColor.yellowColor()
                two.tintColor = UIColor.yellowColor()
                three.tintColor = UIColor.blueColor()
                four.tintColor = UIColor.blueColor()
                five.tintColor = UIColor.blueColor()
            case 3:
                movieRateLabel.text = "Нармасік"
                one.tintColor = UIColor.yellowColor()
                two.tintColor = UIColor.yellowColor()
                three.tintColor = UIColor.yellowColor()
                four.tintColor = UIColor.blueColor()
                five.tintColor = UIColor.blueColor()
            case 4:
                movieRateLabel.text = "Крутяк"
                one.tintColor = UIColor.yellowColor()
                two.tintColor = UIColor.yellowColor()
                three.tintColor = UIColor.yellowColor()
                four.tintColor = UIColor.yellowColor()
                five.tintColor = UIColor.blueColor()
            case 5:
                movieRateLabel.text = "Оскара несіть"
                one.tintColor = UIColor.yellowColor()
                two.tintColor = UIColor.yellowColor()
                three.tintColor = UIColor.yellowColor()
                four.tintColor = UIColor.yellowColor()
                five.tintColor = UIColor.yellowColor()
            default:
                movieRateLabel.text = ""
            }
        }
    }
    
    @IBAction func okPressed(sender: AnyObject) {
        if let readyRate = rate{
            movieToRate!.rating = readyRate
        }
        delegate?.RateMovie(self, movieToRate: movieToRate!)
    }
    
    @IBAction func oscarPressed(sender: UIButton) {
        switch sender.tag {
        case 1:
            rate = 1
            movieRateLabel.text = "Фуфло"
            one.tintColor = UIColor.yellowColor()
            two.tintColor = UIColor.blueColor()
            three.tintColor = UIColor.blueColor()
            four.tintColor = UIColor.blueColor()
            five.tintColor = UIColor.blueColor()
        case 2:
            rate = 2
            movieRateLabel.text = "Ну такоє"
            one.tintColor = UIColor.yellowColor()
            two.tintColor = UIColor.yellowColor()
            three.tintColor = UIColor.blueColor()
            four.tintColor = UIColor.blueColor()
            five.tintColor = UIColor.blueColor()
        case 3:
            rate = 3
            movieRateLabel.text = "Нармасік"
            one.tintColor = UIColor.yellowColor()
            two.tintColor = UIColor.yellowColor()
            three.tintColor = UIColor.yellowColor()
            four.tintColor = UIColor.blueColor()
            five.tintColor = UIColor.blueColor()
        case 4:
            rate = 4
            movieRateLabel.text = "Крутяк"
            one.tintColor = UIColor.yellowColor()
            two.tintColor = UIColor.yellowColor()
            three.tintColor = UIColor.yellowColor()
            four.tintColor = UIColor.yellowColor()
            five.tintColor = UIColor.blueColor()
        case 5:
            rate = 5
            movieRateLabel.text = "Оскара несіть"
            one.tintColor = UIColor.yellowColor()
            two.tintColor = UIColor.yellowColor()
            three.tintColor = UIColor.yellowColor()
            four.tintColor = UIColor.yellowColor()
            five.tintColor = UIColor.yellowColor()
        default:
            print("Sth is wrong")
            
        }
    }
}
