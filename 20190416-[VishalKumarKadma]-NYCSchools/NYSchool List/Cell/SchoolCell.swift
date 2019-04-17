//
//  SchoolCell.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import UIKit

class SchoolCell: UICollectionViewCell {

    @IBOutlet weak var location: UILabel!
    let tableViewVC = NYCSchoolDetailsTableViewController()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        setupTableView()
        // Initialization code
    }
    
    func setupTableView() {
        tableViewVC.tableView.frame = self.frame
        addSubview(tableViewVC.tableView)
    }
    
    func setDataSource(dataSource : SchoolCellVM){
        tableViewVC.dataSourced = dataSource.dataSource
        //tableViewVC.dataSource = dataSource as! [String]
    }
    
    
    
    
    
    

}
