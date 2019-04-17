//
//  SchoolDetailsTableVC.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import UIKit

class NYCSchoolDetailsTableViewController: UITableViewController {
  
    var dataSourced  = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isUserInteractionEnabled = false
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableviewidentifier")
    }
  
}

extension NYCSchoolDetailsTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourced.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewidentifier", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text =  dataSourced[indexPath.row]
        cell.textLabel?.textColor = UIColor.blue
        cell.textLabel?.backgroundColor = UIColor.lightGray
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
