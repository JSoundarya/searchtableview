//
//  RootViewController.swift
//  SplitViewExample
//
//  Created by 419764 on 1/10/18.
//  Copyright © 2018 Cognizant. All rights reserved.
//

import UIKit

var currDetail = DetailViewController()
class RootViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var companies = ["Accenture","Accord","Akamai","ANZ","Borland","Citrix","Cognizant","Dawn","Fortune","Pramati","Samsung","SAP","Sapient","Seaton","Silver","Simplex","Siri"]
    var name = ["Accenture","Accord","Akamai","ANZ","Borland","Citrix","Cognizant","Dawn","Fortune","Pramati","Samsung","SAP","Sapient","Seaton","Silver","Simplex","Siri"]
    var explanation = ["High Performance Delivered","The Luxury Sports Sedan,Redefined","Faster Forward","We live in your world","Excellence Endures","Now Everything Computes","Passion for building stronger businesses","rising for domestic peace","at fort york","ideas to life","Experience store","Business One","Global Markets","Residential and Holiday Village","Touch of Silver","Insight Onsite","Construction"]
    var newData = [
        "Accenture": ["Accenture",
                      "High Performance Delivered"],
        "Accord": ["Accord",
                       "The Luxury Sports Sedan,Redefined"],
        "Akamai":  ["Akamai",
                       "Faster Forward"],
        "ANZ": ["ANZ",
                       "We live in your world"],
        "Borland":  ["Borland",
                       "Excellence Endures"],
        "Citrix":  ["Citrix",
                       "Now Everything Computes"],
        "Cognizant":  ["Cognizant",
                       "Passion for building stronger businesses"],
        "Dawn":  ["Dawn",
                       "rising for domestic peace"],
        "Fortune":  ["Fortune",
                       "at fort york"],
        "Pramati":  ["Pramati",
                       "ideas to life"],
        "Samsung":  ["Samsung",
                       "Experience store"],
        "SAP":  ["SAP",
                       "Business One"],
        "Sapient":  ["Sapient",
                 "Global Markets"],
        "Seaton":  ["Seaton",
                 "Residential and Holiday Village"],
        "Silver":  ["Silver",
                 "Touch of Silver"],
        "Simplex":  ["Simplex",
                    "Insight Onsite"],
        "Siri":  ["Siri",
                    "Construction"]
        
    ]
    
    
    var filteredArray: [String] = []
     let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        currList = self
        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != nil {
            
            return self.filteredArray.count
        }
        else
        {
            return self.companies.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companycell") as! CompanyTableViewCell
        if searchController.isActive && searchController.searchBar.text != "" {
            
            cell.companyName.text = self.filteredArray[indexPath.row]
        }
        else {
            cell.companyName.text = self.companies[indexPath.row]
        }
        return cell
    }
  
    func filterContentForSearch(searchString: String){
        self.filteredArray = self.companies.filter(){nil != $0.range(of: searchString)}
        self.tableView.reloadData()
        
    }
    
   
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        self.filterContentForSearch(searchString: searchController.searchBar.text!)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = tableView.indexPathForSelectedRow
        currDetail.nameCompany.text = name[(index?.row)!]
        currDetail.descriptionCompany.text = explanation[(index?.row)!]
      //  self.tableView.reloadData()
      
//        currDetail.nameCompany.text = newData[(cell?.textLabel?.text)!]![0]
  //      currDetail.descriptionCompany.text = newData[(cell?.textLabel?.text)!]![1]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
