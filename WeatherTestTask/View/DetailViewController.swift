//
//  DetailViewController.swift
//  WeatherTestTask
//
//  Created by Максим Пасюта on 01.02.2022.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var ConditionLabel: UILabel!
    @IBOutlet weak var tempCityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var feelTempLabel: UILabel!
    
    var weatherModel: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshLabels()
    }
    
    func refreshLabels(){
        
        nameCityLabel.text = weatherModel?.name
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(weatherModel!.conditionCode).svg")
        
        let weatherImage = UIView(SVGURL: url!) {(image) in
            image.resizeToFit(self.viewCity.bounds)
        }
        self.viewCity.addSubview(weatherImage)
        
        ConditionLabel.text =  weatherModel?.conditionString
        tempCityLabel.text =  weatherModel?.temperatureString
        pressureLabel.text = "\((weatherModel?.presureMm)!)"
        windSpeedLabel.text = "\((weatherModel?.windSpeed)!)"
        minTempLabel.text = "\((weatherModel?.tempMin)!)"
        maxTempLabel.text = "\((weatherModel?.tempMax)!)"
        feelTempLabel.text = "\((weatherModel?.feelLike)!)"
    }
}
