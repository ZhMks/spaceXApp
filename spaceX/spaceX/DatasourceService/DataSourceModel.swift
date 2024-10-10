//
//  DataSourceModel.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//

import SwiftUI

struct ResponseModel {
    var height: ResponseModelParam
    var diamter: ResponseModelParam
    var firstStage: ResponseModelFirstStage
    var secondStage: ResponseModelSecondStage
    var payloadWeight: [ResponseModelPayloadWeight]
    var flickImages: [String]
    var name: String
    var type: String
    var costPerLaunch: Double
    var successratePct: Double
    var firstFlight: String
    var country: String
    var company: String
    var description: String
    var mass: ResponseModelMass
}

struct ResponseModelParam {
    var meters: Double?
    var feet: Double?
}

struct ResponseModelMass {
    var kg: Double?
    var lb: Double?
}

struct ResponseModelFirstStage{
    var engines: Int?
    var fuelAmountTons: Double
    var burnTimeSeconds: Double?
}

struct ResponseModelSecondStage {
    var engines: Int?
    var fueldAmountTons: Double?
    var burnTimeSeconds: Double?
}


struct ResponseModelPayloadWeight {
    var id: String
    var name: String
    var kg: Double
    var lb: Double
}

