//
//  NetworkRequest.swift
//  20190416-[VishalKumarKadma]-NYCSchools
//
//  Created by VishalKumar Kadma on 4/16/19.
//  Copyright © 2019 VishalKumar Kadma. All rights reserved.
//

import Foundation

typealias DataHandler = (_ data:Result<Data, ErrorResult>?)-> Void
typealias ResponseHandler = (_ response:Result<Any, ErrorResult>)-> Void


class NetworkRequest {
    
    public static let shared = NetworkRequest.init()

    
    ///Function will help you in fetching the service response in the form of Result using below parameters
    /// - Parameters:
    ///   - urlString:  url in string format.
    ///   - pageOffset: limited number of response count(its a optional).
    ///   - codableClassName : Geniric Decodable parameter,Pass codable class name to perform decoding
    /// - completionHandler : clouser response handler will return you Result containing either Success Response or Error
    
    func fetchResult<Element: Decodable>(urlString:String, pageOffset:Int?=nil, codableClassName: Element.Type, completionHandler: @escaping ResponseHandler) {
        
        getAPIData(for: urlString){ dataResult in
            
            DispatchQueue.global(qos:.background).async(execute: {
                switch dataResult{
                case .success(let data)? :
                    do {
                        let jsondata = try JSONDecoder().decode(codableClassName, from: data) // do your decoding here
                        completionHandler(.success(jsondata))
                    } catch {
                        completionHandler(.failure(.network(string: "error")))
                    }
                    break
                case .failure( _)? :
                    completionHandler(.failure(.network(string: "error")))
                    break
                case .none: break
                    
                }
            })
        }
    }
    
    ///Function to make urlsession data task
    /// - Parameters:
    ///   - urlString:  url in string format.
    /// - completionHandler : s
    
    func getAPIData(for urlString:String , session:URLSession = URLSession(configuration: .default),completionHandler: @escaping DataHandler)
    {
        guard let url = URL(string: urlString) else { return }
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let urlResponse = response as? HTTPURLResponse,
                urlResponse.hasSuccessStatusCode, let data = data else {
                    completionHandler(.failure(.network(string: "error")))
                    return
            }
            completionHandler(.success(data))
        }
        dataTask.resume()
    }
}

extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}
