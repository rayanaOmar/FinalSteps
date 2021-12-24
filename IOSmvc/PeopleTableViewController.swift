//
//  PeopleTableViewController.swift
//  IOSmvc
//
//  Created by admin on 23/12/2021.
//

import UIKit

//struct for people details
struct People {
    var name: String
    var gender: String
    var year: String
    var mass: String

}

class PeopleTableViewController: UITableViewController {
    
    var peopleArray: [People] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPeople()
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = peopleArray[indexPath.row].name
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peopleDetails = storyboard?.instantiateViewController(withIdentifier: "idForPeople") as! PeopleDetailsViewController

        let info = peopleArray[indexPath.row]

        peopleDetails.name = info.name
        peopleDetails.gender = info.gender
        peopleDetails.year = info.year
        peopleDetails.mass = info.mass

        self.navigationController?.pushViewController(peopleDetails, animated: true)
        print("Selected")


    }
   
    
    func getPeople(){
        
        StarsWarsModel.getAllPeople { data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.peopleArray.append(People(
                                    name: jsonObject["name"] as! String,
                                    gender: jsonObject["gender"] as! String,
                                    year: jsonObject["birth_year"] as! String,
                                    mass: jsonObject["mass"] as! String))
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
