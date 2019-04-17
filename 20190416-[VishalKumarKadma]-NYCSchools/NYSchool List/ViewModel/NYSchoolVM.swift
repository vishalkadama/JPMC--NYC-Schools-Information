//
//  NYSchoolVM.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation
 class NYSchoolVM {
    

    public init(service: NYSchoolServiceHelper) {
        self.service = service
    }
    
    var dataSource = [Any](){
        didSet{
            prepareSchoolVMArray()
        }
    }
    // Used to bind the data 
    var state = React<State>.init(State.isEmpty)
    
    var dataSourceCount: Int {
        return (dataSource.count)
    }
    var schoolListVM : [SchoolCellVM] = []
    
    var service:NYSchoolServiceHelper
    

    func prepareSchoolVMArray() {
        var cellArray = [SchoolCellVM]()
        dataSource.forEach({ (result) in
            cellArray.append(SchoolCellVM.init(data: result as! NYSchoolsModel))
        })
        self.schoolListVM = cellArray
    }
    
    // Service call is initiated further request and repsone is formed in NYSchoolServiceHelper
    func fetchSchoolList(offset : Int)   {
        if state.value == .isLoading {
            return
        }

        self.state.value = .isLoading
        service.fetchResults(offset: offset) { (data, error) in
            if let data = data{
                DispatchQueue.main.async {
                    self.dataSource.append(contentsOf: data)
                    print(data)
                    self.state.value = .isLoaded
                }
            }else{}
            self.state.value = State.isError
        }
    }
}


