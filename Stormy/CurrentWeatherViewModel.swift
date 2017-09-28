//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Marcin Pietrzak on 28.09.2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather) {
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%"
        let precipitationProbabilityPercentValue = Int(model.precipitationProbability * 100)
        self.precipitationProbability = "\(precipitationProbabilityPercentValue)%"
        self.summary = model.summary
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.image
    }
}
