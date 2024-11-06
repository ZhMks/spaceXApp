//
//  InfotmationViewModel.swift
//  spaceX
//
//  Created by Максим Жуин on 04.10.2024.
//

import SwiftUI


enum HeightModelState: String, CaseIterable {
    case feet
    case meters


    var description: String {
        switch self {
        case .feet:
            return "ft"
        case .meters:
            return "m"
        }
    }
}

enum DiameterModelState:String, CaseIterable {
    case feet
    case meters

    var description: String {
        switch self {
        case .feet:
            return "ft"
        case .meters:
            return "m"
        }
    }
}

enum MassModelState:String, CaseIterable {
    case kg
    case lbs

    var description: String {
        switch self {
        case .kg:
            return "kg"
        case .lbs:
            return "lbs"
        }
    }
}


