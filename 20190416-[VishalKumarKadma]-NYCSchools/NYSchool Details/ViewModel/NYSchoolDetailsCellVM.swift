//
//  NYSchoolDetailsVM.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

class NYSchoolDetailsCellVM {
    
    private var schoolDetailsModel:NYSchoolDetailsModel
    
    public var dbn : String?{
        get{
            return schoolDetailsModel.dbn
        }
    }
    public var testTakers : String?{
        return schoolDetailsModel.testTakers
    }
    public var mathAvg : String?{
        return schoolDetailsModel.mathAvg
    }
    public var avgScore : String?{
        return schoolDetailsModel.avgScore
    }
    public var schoolName : String?{
        return schoolDetailsModel.schoolName
    }
    public var readingAvg : String?{
        return schoolDetailsModel.readingAvg
    }
    
    
    public var dataSource: [String] {
        
        var source = [""]
        if let schoolName = schoolName , let testTakers = testTakers , let mathAvg = mathAvg , let avgScore = avgScore, let readingAvg = readingAvg {
            source = [ "School Name: \(String(describing: schoolName))",
                "Test Taker: \(String(describing: testTakers))",
                "Math avg: \(String(describing: mathAvg))",
                "Average Score: \(String(describing: avgScore))",
                "Reading Average: \(String(describing: readingAvg))" ]
        }
        return source
    }
    
    init(data : NYSchoolDetailsModel) {
        self.schoolDetailsModel = data
    }
  
}



