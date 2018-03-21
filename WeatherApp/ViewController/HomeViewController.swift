//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Apple on 22/03/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SVGKit

class HomeViewController: UIViewController {
    
    class func instantiateFromStoryboard() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! HomeViewController
    }
    
    @IBOutlet weak var lblWeather: UILabel!
    
    @IBOutlet weak var imgRed: UIImageView!
    @IBOutlet weak var imgGreen: UIImageView!
    @IBOutlet weak var imgBlue: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.GetWeather(cityName: "karachi")
        
        let redSVGImage: SVGKImage = SVGKImage(named: "RedCircle")
        let greenSVGImage: SVGKImage = SVGKImage(named: "GreenCircle")
        let blueSVGImage: SVGKImage = SVGKImage(named: "BlueCircle")
        
        imgRed.image = redSVGImage.uiImage
        imgGreen.image = greenSVGImage.uiImage
        imgBlue.image = blueSVGImage.uiImage
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func GetWeather(cityName: String) {
        
        let param = ["q" : cityName, "APPID": APP_ID]
        WeatherServices.GetWeatherByCityName(param: param) { (response, success, message) in
            
            if success {
                
                let weather = response!["main"]!["temp"] as! Float
                let name = response!["name"]! as! String
                let weatherCelcius = round(weather - 273.15)
                DispatchQueue.main.async {
                    self.lblWeather.text = "\(name) Temperature: \(weatherCelcius)°C"
                }
            }
            else {
                print(message!)
            }
        }
    }
    
}

