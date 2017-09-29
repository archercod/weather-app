//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Marcin Pietrzak on 29.09.2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidUrl
    case JSONParsinFailure
}
