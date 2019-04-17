//
//  SchoolListService.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

public protocol NYSchoolServiceHelperProtocol{
    func fetchResults(offset:Int,resultHandler: @escaping ([Any]?, String?) -> Void)
}


// The idea is to form request of each service call differntly.
extension NYSchoolServiceHelperProtocol{
    func fetchResults(offset:Int,resultHandler: @escaping ([Any]?, String?) -> Void) {

        let urlString = String.init(format: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=19&$offset=%d", offset)
        
        NetworkRequest.shared.fetchResult(urlString: urlString, codableClassName: Array<NYSchoolsModel>.self) { result in
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
