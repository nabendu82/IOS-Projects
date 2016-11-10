//
//  Constants.swift
//  RainyShiny
//
//  Created by Nabendu Biswas on 06/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "41362d72ffa232cbf07f864db3a8f8e7"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude)!\(LONGITUDE)\(Location.sharedInstance.longitude)!\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude)!&lon=\(Location.sharedInstance.longitude)!&cnt=10&mode=json&appid=41362d72ffa232cbf07f864db3a8f8e7"

