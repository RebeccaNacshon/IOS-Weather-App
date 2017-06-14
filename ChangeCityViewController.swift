//
//  ChangeCityViewController.swift
//  WeatherRebecca
//
//  Created by admin on 13/04/2017.
//  Copyright © 2017 iOS Dev. All rights reserved.
//

import UIKit

class ChangeCityViewController: UIViewController {

    @IBOutlet var ResultFind: UILabel!
    @IBOutlet var newCity: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addButton_click(_ sender: UIButton) {
        var description:String
        
    let city=self.newCity.text!.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        let urlInitial = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6bfb45086fe7c9887548fe11fa9cb66f&units=metric&cnt=1"
        
        if let url=URL(string:urlInitial){
        
            
            // set up the session
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            // make the request
           session.dataTask(with: url,completionHandler:{ (data, response, error) in
                // do stuff with response, data & error here
            if let error=error{
               print(error)
                
            }
            else{
                if let data=data{
                    let json=JSON(data:data)
                    print(json)
                    let message=json["message"]
                    let temperature = String(Int(Float(json["main"]["temp"].stringValue)!)) + "°"
                    let city=json["name"].stringValue
                    let description=json["weather"][0]["main"].stringValue
                    
                    
                    print(temperature)
                    if(message != "city not found"){
                        
                        print(city)
                        self.getMultiDayForecast(cityName: city)
                        DispatchQueue.main.async{
                        
                            self.newCity.text=city
                            self.ResultFind.text=city
                            DataModel.cityName=city
                            DataModel.temperature=temperature
                            DataModel.weatherDescription=description
                            
                        }
                    }
                    else{
                        DispatchQueue.main.async{
                            self.newCity.text="City not found"
                            self.ResultFind.text="City not found"
                        }
                    
                    }
                    
                }
            }
            }).resume()

            
            
        }
        
    }
    
    
     func getMultiDayForecast(cityName:String)
     {
     
        
        
        var description:String
        
        let city=self.newCity.text!.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        

        let urlInitial="http://api.openweathermap.org/data/2.5/forecast/daily?q=/(city)&mode=json&units=metric&APPID=6bfb45086fe7c9887548fe11fa9cb66f&cnt=4"
        
        if let url=URL(string:urlInitial){
            let config = URLSessionConfiguration.default
             let session = URLSession(configuration: config)
            
             session.dataTask(with: url,completionHandler:{ (data, response, error) in
                if let error = error {
                    print("Error retrieving multi day forecast data: \(error.localizedDescription)")
                } else {
                    if let data = data {
                        let json = JSON(data:data)
                        print(json)
                     //   DataModel.fiveDayForecast.removeAll()
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "EEE MMM dd"
                        
                        //index = 1
                        let temperatureMin1 = String(Int(Float(json["list"][1]["temp"]["min"].stringValue)!)) + "°"

                        let temperatureMax1 = String(Int(Float(json["list"][1]["temp"]["max"].stringValue)!)) + "°"
                        let description1 = json["list"][1]["weather"][0]["main"].stringValue
                        let time1:TimeInterval = TimeInterval(json["list"][1]["dt"].stringValue)!
                        let date1 = NSDate(timeIntervalSince1970: time1)
                        let dateString1 = dateFormatter.string(from: date1 as Date)
                        DataModel.fiveDayForecast.append((dateString1, description1, temperatureMin1, temperatureMax1))
                        
                        
                        //index = 2
                        let temperatureMin2 = " " + String(Int(Float(json["list"][2]["temp"]["min"].stringValue)!))
                        let temperatureMax2 = " " + String(Int(Float(json["list"][2]["temp"]["max"].stringValue)!))
                        let description2 = json["list"][2]["weather"][0]["main"].stringValue
                        let time2:TimeInterval = TimeInterval(json["list"][2]["dt"].stringValue)!
                        let date2 = NSDate(timeIntervalSince1970: time2)
                        let dateString2 = dateFormatter.string(from: date2 as Date)
                        DataModel.fiveDayForecast.append((dateString2, description2, temperatureMin2, temperatureMax2))
                        
                        //index = 3
                        let temperatureMin3 = " " + String(Int(Float(json["list"][3]["temp"]["min"].stringValue)!))
                        let temperatureMax3 = " " + String(Int(Float(json["list"][3]["temp"]["max"].stringValue)!))
                        let description3 = json["list"][3]["weather"][0]["main"].stringValue
                        let time3:TimeInterval = TimeInterval(json["list"][3]["dt"].stringValue)!
                        let date3 = Date(timeIntervalSince1970: time3)
                        let dateString3 = dateFormatter.string(from: date3)
                        DataModel.fiveDayForecast.append((dateString3, description3, temperatureMin3, temperatureMax3))
                        print(dateString3, description3, temperatureMin3, temperatureMax3)
                        
                    }
                    else {
                        print("no multi day forecast data")
                    }
                }
            }).resume()
        }

        
    
    }
    override func didReceiveMemoryWarning()
    
    {
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

}
