//
//  School.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

class SchoolCellVM {
    
    private var nySchoolModel:NYSchoolsModel
    public var directions : String?{
        get{
            return nySchoolModel.directions
        }
    }
    public var eligibility : String?{
        return nySchoolModel.eligibility
    }
    public var zip : String?{
        return nySchoolModel.zip
    }
    public var city : String?{
        return nySchoolModel.city
    }
    public var website : String?{
        return nySchoolModel.website
    }
    
    public var schoolname : String?{
        return nySchoolModel.schoolname
    }
    public var primaryaddressline_1 : String?{
        return nySchoolModel.primaryaddressline_1
    }
    public var phonenumber : String?{
        return nySchoolModel.phonenumber ?? ""
    }
    public var location : String?{
        return nySchoolModel.location
    }
    public var dbn : String?{
        return nySchoolModel.dbn
    }
    public var extracurricularactivities : String?
    public var latitude : String?
    
    public var dataSource: [String] {
// unwrapping optinoals
        var source = [""]
        if let schoolname = schoolname{
           source.append("School Name: \(String(describing: schoolname))")
        }
        if let website = website{
            source.append("Website: \(String(describing: website))")
        }
        if let phonenumber = phonenumber{
            source.append("Phone: \(String(describing: phonenumber))")
        }
        if let primaryaddressline_1 = primaryaddressline_1{
            source.append("Address: \(String(describing: primaryaddressline_1))")
        }
        if let eligibility = eligibility{
            source.append("Eligibility: \(String(describing: eligibility))")
        }
        if let zip = zip{
            source.append("zip: \(String(describing: zip))")
        }
        if let extracurricularactivities = extracurricularactivities{
            source.append("extracurricularactivities: \(String(describing: extracurricularactivities))")
        }
        return source
    
    }
    
    init(data : NYSchoolsModel) {
        self.nySchoolModel = data
    }
    
}
