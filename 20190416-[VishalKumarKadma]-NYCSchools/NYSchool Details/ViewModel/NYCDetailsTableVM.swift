//
//  NYCDetailsTableVM.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

class NYCDetailsTableVM {
    
    
    public init(service: NYCSchoolDetailsServiceHelper) {
        self.service = service
    }
    
    var dataSource = [Any](){
        didSet{
            prepareSchoolDetails()
        }
    }
    var state = React<State>.init(State.isEmpty)
    
    var dataSourceCount: Int {
        return (dataSource.count)
    }
    var schoolDetailsArray : [NYSchoolDetailsCellVM] = []
    
    var service:NYCSchoolDetailsServiceHelper
    
    
    func prepareSchoolDetails() {
        var cellArray = [NYSchoolDetailsCellVM]()
        dataSource.forEach({ (result) in
            cellArray = [(NYSchoolDetailsCellVM.init(data: result as! NYSchoolDetailsModel))]
            
        })
        self.schoolDetailsArray = cellArray
    }
    
    func fetchSchoolList(uniqueId : String)   {
        if state.value == .isLoading {
            return
        }
        
        self.state.value = .isLoading
        service.fetchResults(uniqueId: uniqueId) { (data, error) in
            if let data = data{
                DispatchQueue.main.async {
                    self.dataSource.append(contentsOf: data)
                    print(data)
                   if self.dataSource.count > 0 {
                        self.state.value = .isLoaded
                   }else {
                    self.state.value = .isEmpty
                    }
                }
            }else{}
            self.state.value = State.isError
        }
    }
}
