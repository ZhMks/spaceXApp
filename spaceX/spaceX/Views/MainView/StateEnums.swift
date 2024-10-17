//
//  InfotmationViewModel.swift
//  spaceX
//
//  Created by Максим Жуин on 04.10.2024.
//

import SwiftUI


enum HeightModelState {
    case feet
    case meters


    var rawValue: String {
        switch self {
        case .feet:
            return "ft"
        case .meters:
            return "m"
        }
    }
}

enum DiameterModelState {
    case feet
    case meters

    var rawValue: String {
        switch self {
        case .feet:
            return "ft"
        case .meters:
            return "m"
        }
    }
}

enum MassModelState {
    case kg
    case lbs

    var rawValue: String {
        switch self {
        case .kg:
            return "kg"
        case .lbs:
            return "lbs"
        }
    }
}


