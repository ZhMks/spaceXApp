//
//  DataSourceModel.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//



struct ResponseModel {
    let height: ResponseModelParam
    let diamter: ResponseModelParam
    let engines: ResponseModelEngines
    let firstStage: ResponseModelFirstStage
    let secondStage: ResponseModelSecondStage
    let landingLegs: ResponseModelLegs
    let payloadWeight: [ResponseModelPayloadWeight]
    let flickImages: [String]
    let name: String
    let type: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Double
    let successratePct: Double
    let firstFlight: String
    let country: String
    let company: String
    let description: String
    let wikipedia: String
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
    let thrustSeaLevel: ResponseModelThrust
    let thrustVacuum: ResponseModelThrust
    let reusable: Bool
    let engines: Int?
    let fuelAmountTons: Double
    let burnTimeSeconds: Double?
}

struct ResponseModelSecondStage {
    let thrust: ResponseModelThrust
    let payloads: ResponseModelPayloads
    let reusable: Bool
    let engines: Int?
    let fueldAmountTons: Double?
    let burnTimeSeconds: Double?
}


struct ResponseModelThrust {
    let kN: Double
    let lbf: Double
}

struct ResponseModelPayloads {
    let compositeFairing: ResponseModelFairing
    let option: String
}

struct ResponseModelFairing{
    let height: ResponseModelParam
    let diameter: ResponseModelParam
}

struct ResponseModelEngines {
    let isp: ResponseModelIsp
    let thrustSeaLevel: ResponseModelThrust
    let thrustVacuum: ResponseModelThrust
    let number: Int
    let tupe: String
    let version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant: String
    let secondPropellant: String
    let thrustToWeight: Double
}

struct ResponseModelIsp {
    let seaLevel: Double
    let vacuum: Double
}

struct ResponseModelLegs {
    let number: Int
    let material: String?
}

struct ResponseModelPayloadWeight {
    let id: String
    let name: String
    let kg: Double
    let lb: Double
}

