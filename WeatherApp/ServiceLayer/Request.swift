//
//  Request.swift
//  Tutorial
//
//  Created by muhammadmaazulhaq on 15/06/2017.
//  Copyright © 2017 muhammadmaazulhaq. All rights reserved.
//

import UIKit

class Request: NSObject {
    
    static func GetRequest(url: String, parameters: [String: String], completionHandler: (([String: AnyObject]?, Bool?, String?) -> Void)?) {
        let urlComp = NSURLComponents(string: url)!
        
        var items = [URLQueryItem]()
        
        for (key,value) in parameters {
            items.append(URLQueryItem(name: key, value: value))
        }
        
        items = items.filter{!$0.name.isEmpty}
        
        if !items.isEmpty {
            urlComp.queryItems = items
        }
        
        var urlRequest = URLRequest(url: urlComp.url!)
        urlRequest.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error == nil && data != nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                    completionHandler?(json, true, nil)
                    
                } catch {
                    completionHandler?(nil, false, response.debugDescription)
                }
            }
            else if error != nil
            {
                completionHandler?(nil, false, error!.localizedDescription)
            }
        })
        task.resume()
        
    }
    
}
