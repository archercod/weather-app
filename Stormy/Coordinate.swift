//
//  Coordinate.swift
//  Stormy
//
//  Created by Marcin Pietrzak on 29.09.2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
    var longitude: Double
    var latitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(longitude),\(latitude)"
    }
}
