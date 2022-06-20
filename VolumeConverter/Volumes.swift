//
//  Volumes.swift
//  VolumeConverter
//
//  Created by Milosz Tabaka on 20/06/2022.
//

import Foundation

enum volumes: Double, CaseIterable {
    case milliliters = 0.001
    case liters = 1.0
    case cups = 0.236588
    case pints = 0.568261
    case gallons = 4.54609
    
    var description: String {
        switch self {
        case .milliliters: return "ml"
        case .liters: return "L"
        case .cups: return "cup"
        case .pints: return "pt"
        case .gallons: return "gal"
            
        }
    }
}

