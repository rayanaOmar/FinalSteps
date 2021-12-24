//
//  PeopleDetailsViewController.swift
//  IOSmvc
//
//  Created by admin on 23/12/2021.
//

import UIKit

class PeopleDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    var name: String?
    var gender: String?
    var year: String?
    var mass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name,
           let gender = gender,
           let year = year,
           let mass = mass {
            
            
            nameLabel.text = "Name: \(String(describing: name))"
            genderLabel.text = "Gender: \(String(describing: gender))"
            yearLabel.text = "Year: \(String(describing: year))"
            massLabel.text = "Mass: \(String(describing: mass))"
            
            
        }
        
     

        // Do any additional setup after loading the view.
    }
}
