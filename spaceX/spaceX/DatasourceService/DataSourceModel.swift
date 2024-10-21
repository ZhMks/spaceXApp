//
//  DataSourceModel.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//

import SwiftUI

protocol ResponseProtocol {

}

struct ResponseModel: ResponseProtocol {
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
    var id: String
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


struct LaunchesFlightModel: ResponseProtocol {
    var name: String
    var date: String
    var success: Bool?
    var id: String
}
