//
//  PeopleTableViewController.swift
//  IOSmvc
//
//  Created by admin on 23/12/2021.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    var peopleArray: [String] = []

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
        cell.textLabel?.text = peopleArray[indexPath.row]

        return cell
}
    func getPeople(){
        
        StarsWarsModel.getAllPeople { data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.peopleArray.append(jsonObject["name"] as! String)
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
