//
//  NYSchoolModel.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

internal struct NYSchoolsModel : Codable{
    public var directions : String?
    public var eligibility : String?
    public var overviewparagraph : String?
    public var city : String?
    public var website : String?
    public var zip : String?
    public var schoolname : String?
    public var primaryaddressline_1 : String?
    public var phonenumber : String?
    public var location : String?
    public var extracurricularactivities : String?
    public var latitude : String?
    public var dbn : String?

    
    
    
    private enum CodingKeys: String, CodingKey {
        case directions = "directions1"
        case eligibility = "eligibility1"
        case overviewparagraph = "overview_paragraph"
        case city = "city"
        case website = "website"
        case zip = "zip"
        case schoolname = "school_name"
        case primaryaddressline_1 = "primary_address_line_1"
        case phonenumber = "phone_number"
        case location = "location"
        case latitude = "latitude"
        case extracurricularactivities = "extracurricular_activities"
        case dbn = "dbn"

        
    }
    
}
