//
//  WeatherServices.swift
//  WeatherApp
//
//  Created by Apple on 22/03/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

class WeatherServices {
    
    //MARK:-  Weather Service Method
    static func GetWeatherByCityName(param:[String: String],
                                     completionHandler:@escaping (_ response: [String: AnyObject]?, _ success: Bool, _ message: String?)->Void) {
        Request.GetRequest(url: ServiceApiEndPoints.byCityName, parameters: param, completionHandler: { (response, isSuccess, message) in
            
            if isSuccess! {
                if let code = response!["cod"] as? Int, code == 200 {
                    completionHandler(response, isSuccess!, message)
                }
                else {
                    completionHandler(nil, false, response!["message"] as? String)
                }
            }
            else {
                completionHandler(nil, false, message)
            }
        })
    }
}
