//
//  File.swift
//  IOTPROJECT
//
//  Created by prem  on 12/10/23.
//

import Foundation

// MARK: - Welcome9
struct Welcome9 : Codable {
    let city: City
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
}

// MARK: - City
struct City : Codable{
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone: Int
}

// MARK: - Coord
struct Coord : Codable {
    let lon, lat: Double
}

// MARK: - List
struct List : Codable {
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let weather: [Weather]
    let speed: Double
    let deg: Int
    let gust: Double
    let clouds: Int
    let pop: Double
    let rain: Double?
}

// MARK: - FeelsLike
struct FeelsLike :Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp : Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - Weather
struct Weather : Codable {
    let id: Int
    let main, weatherDescription, icon: String
}
