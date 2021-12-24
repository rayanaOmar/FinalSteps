//
//  FilmsDetailsViewController.swift
//  IOSmvc
//
//  Created by admin on 23/12/2021.
//

import UIKit

class FilmsDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    
    var titleF: String?
    var releaseDate: String?
    var director: String?
    var openingCr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let titleF = titleF,
        let releaseDate = releaseDate,
        let director = director,
        let openingCr = openingCr{
            
            
            titleLabel.text = "Title: \(String(describing: titleF))"
            releaseDateLabel.text = "Release Date: \(String(describing: releaseDate))"
            directorLabel.text = "Director: \(String(describing: director))"
            openingCrawlLabel.text = "Opening Crawl: \(String(describing: openingCr))"
            
        }
        
       
           
        
        
        // Do any additional setup after loading the view.
    }  
}
