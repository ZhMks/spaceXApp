//
//  DataSourceModel.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//



struct ResponseModel {
    let height: ResponseModelParam
    let diamter: ResponseModelParam
    let firstStage: ResponseModelFirstStage
    let secondStage: ResponseModelSecondStage
    let payloadWeight: [ResponseModelPayloadWeight]
    let flickImages: [String]
    let name: String
    let type: String
    let costPerLaunch: Double
    let successratePct: Double
    let firstFlight: String
    let country: String
    let company: String
    let description: String
}

struct ResponseModelParam {
    let meters: Double?
    let feet: Double?
}

struct ResponseModelMass {
    let kg: Double?
    let lb: Double?
}

struct ResponseModelFirstStage{
    let engines: Int?
    let fuelAmountTons: Double
    let burnTimeSeconds: Double?
}

struct ResponseModelSecondStage {
    let engines: Int?
    let fueldAmountTons: Double?
    let burnTimeSeconds: Double?
}


struct ResponseModelPayloadWeight {
    let id: String
    let name: String
    let kg: Double
    let lb: Double
}

