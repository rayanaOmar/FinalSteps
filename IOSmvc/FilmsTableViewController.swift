//
//  FilmsTableViewController.swift
//  IOSmvc
//
//  Created by admin on 23/12/2021.
//

import UIKit

struct Films{
    var titleF: String
    var releaseDate: String
    var director: String
    var openingCr: String
    
}

class FilmsTableViewController: UITableViewController {
    
    var filmsArray: [Films] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        filmsApi()

    }

    
    // MARK: - Table view data sourc
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filmsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = filmsArray[indexPath.row].titleF
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmsDetails = storyboard?.instantiateViewController(withIdentifier: "FilmsDetails") as! FilmsDetailsViewController
        
        let info = filmsArray[indexPath.row]
        
        filmsDetails.titleF = info.titleF
        filmsDetails.releaseDate = info.releaseDate
        filmsDetails.director = info.director
        filmsDetails.openingCr = info.openingCr
        
        self.navigationController?.pushViewController(filmsDetails, animated: true)
        
    
    }
    //Function Section
    
    func filmsApi(){
        
        StarsWarsModel.getAllFilms { data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.filmsArray.append(Films(
                                    titleF: jsonObject["title"] as! String,
                                    releaseDate: jsonObject["release_date"] as! String,
                                    director: jsonObject["director"] as! String,
                                    openingCr: jsonObject["opening_crawl"] as! String))
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
                
            }
        }
    }
  
}


