//
//  NYSchoolDetails.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

internal struct NYSchoolDetailsModel : Codable{
    public var dbn : String?
    public var testTakers : String?
    public var mathAvg : String?
    public var avgScore : String?
    public var schoolName : String?
    public var readingAvg : String?

    
    
    
    private enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case testTakers = "num_of_sat_test_takers"
        case readingAvg = "sat_critical_reading_avg_score"
        case mathAvg = "sat_math_avg_score"
        case avgScore = "sat_writing_avg_score"
        case schoolName = "school_name"


        
    }
    
}
