//
//  NYCDetailTableView.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/17/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import UIKit

class NYCDetailTableView: UITableViewController {
    var dbn : String = ""
    
    lazy var nYCDetailsTableVM:NYCDetailsTableVM = {
        var service  = NYCSchoolDetailsServiceHelper.init()
        let schoolVm = NYCDetailsTableVM.init(service: service)
        return schoolVm
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nYCDetailsTableVM.fetchSchoolList(uniqueId: dbn)
  self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableviewidentifier")
    setUpBinding()
    }
    func setUpBinding()  {
        nYCDetailsTableVM.state.bind { (value) in
            guard let value = value else {
                return
            }
            self.removeLoader()
            self.showLoader()

            switch value {
            case .isLoaded:
                self.tableView.reloadData()
                break
            case .isLoading:
                self.showLoader()
                break
            case .isError:
                break
            case .isEmpty:
                self.showLoader(textdata: "No Data")
                break
            }
        }
    }
    func showLoader(textdata:String?=nil) {
        let loadingLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 70))
        loadingLabel.textColor = UIColor.black
        loadingLabel.tag = 929
        if textdata?.isEmpty ?? true{
            loadingLabel.text = "Loading.."
        }else{
            loadingLabel.text = textdata
        }
        loadingLabel.backgroundColor = UIColor.red
        self.view.addSubview(loadingLabel)
        loadingLabel.bringSubviewToFront(self.view)
    }
    func removeLoader() {
        DispatchQueue.main.async{
            self.view.viewWithTag(929)?.removeFromSuperview()
        }
    }
       
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nYCDetailsTableVM.schoolDetailsArray.last?.dataSource.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewidentifier", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = nYCDetailsTableVM.schoolDetailsArray.last?.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.blue
        cell.textLabel?.backgroundColor = UIColor.lightGray
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    


}
