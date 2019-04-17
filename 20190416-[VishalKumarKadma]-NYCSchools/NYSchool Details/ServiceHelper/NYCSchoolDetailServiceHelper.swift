//
//  SchoolDetailServiceHelper.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

public protocol NYSchoolDetailsServiceHelperProtocol{
    func fetchResults(uniqueId:String,resultHandler: @escaping ([Any]?, String?) -> Void)
}



extension NYSchoolDetailsServiceHelperProtocol{
    func fetchResults(uniqueId:String,resultHandler: @escaping ([Any]?, String?) -> Void) {
        
        let urlString = String.init(format: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=%@", uniqueId)
        
        NetworkRequest.shared.fetchResult(urlString: urlString, codableClassName: Array<NYSchoolDetailsModel>.self) { result in
            switch result {
            case .failure( _):
                resultHandler([],"error")
                break
            case .success (let response):
                DispatchQueue.main.async {
                    resultHandler(response as? [Any] ?? [] ,nil)
                }
                break
                
            }
        }
    }
}
