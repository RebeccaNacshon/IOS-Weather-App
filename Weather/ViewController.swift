//
//  ViewController.swift
//  WeatherRebecca
//
//  Created by admin on 12/04/2017.
//  Copyright © 2017 iOS Dev. All rights reserved.
//

import UIKit


class ViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var titleImage: UIImageView!
    @IBOutlet var temperature: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if DataModel.cityName != nil {
            print("\(DataModel.cityName)=\(DataModel.temperature)")
            self.temperature.text = DataModel.temperature
            self.city.text = DataModel.cityName
            
            if ((DataModel.weatherDescription!.contains("Rain"))){
                self.titleImage.image = UIImage(named: "Rainy")
                                    gradient(view: self.view, layerName: "Rainy", topRed: 153, topGreen: 177, topBlue: 195, botRed: 43, botGreen: 58, botBlue: 90)
               
            }
            else if ((DataModel.weatherDescription!.contains("Clear"))){
                self.titleImage.image = UIImage(named: "Sunny")
               
                    gradient(view: self.view, layerName: "Sunny", topRed: 253, topGreen: 245, topBlue: 62, botRed: 251, botGreen: 168, botBlue: 46)
              
            }
            else if ((DataModel.weatherDescription!.contains("Cloud"))){
                self.titleImage.image = UIImage(named: "Cloudy")
               
                    gradient(view: self.view, layerName: "Cloudy", topRed: 97, topGreen: 97, topBlue: 97, botRed: 255, botGreen: 255, botBlue: 255)
                
            }
        }
        
        
        print("after layers add \(self.view.layer.sublayers!.count)")
        tableview.reloadData()
    }
    
    //MARK: Tableview\
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return DataModel.fiveDayForecast.count
        
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
       let (date, description, tempMin, tempMax) = DataModel.fiveDayForecast[indexPath.row]
        cell.date.text = date
        cell.temp.text = "\(tempMax)/\(tempMin)"
        if description.contains("Clear"){
            cell.descriptionImage.image = UIImage(named: "Sunny")
        }
        else if description.contains("Cloud"){
            cell.descriptionImage.image = UIImage(named: "Cloudy")
        }
        else if description.contains("Rain"){
            cell.descriptionImage.image = UIImage(named: "Rainy")
        }
        
        return cell
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

