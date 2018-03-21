//
//  ServiceApiEndPoints.swift
//  WeatherApp
//
//  Created by Apple on 22/03/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ServiceApiEndPoints: NSObject {
    
    static let baseURL = "http://api.openweathermap.org/data/2.5"
    
    static let byCityName = baseURL + "/weather"
}
