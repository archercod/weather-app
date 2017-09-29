//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Marcin Pietrzak on 29.09.2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let apiKey = "79a4ff6b5ce497ff0f5ff19641113eef"
    
    var baseURL: URL {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        guard let url = URL(string: coordinate.description ,relativeTo: baseURL) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { (json, error) in
            guard let json = json else {
                completion(nil, error)
                return
            }
            
            guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                completion(nil, .JSONParsinFailure)
                return
            }
            
            completion(currentWeather, nil)
        }
        
        task.resume()
    }
}
