//
//  InfotmationViewModel.swift
//  spaceX
//
//  Created by Максим Жуин on 04.10.2024.
//

import SwiftUI


enum HeightModelState: String, CaseIterable {
    case ft
    case m


    var description: String {
        switch self {
        case .ft:
            return "ft"
        case .m:
            return "m"
        }
    }
}

enum DiameterModelState:String, CaseIterable {
    case ft
    case m

    var description: String {
        switch self {
        case .ft:
            return "ft"
        case .m:
            return "m"
        }
    }
}

enum MassModelState:String, CaseIterable {
    case kg
    case lb

    var description: String {
        switch self {
        case .kg:
            return "kg"
        case .lb:
            return "lbs"
        }
    }
}


