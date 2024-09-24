//
//  NetworkModel.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//


struct NetworkModel: Decodable {
    let height: SpaceRocketHeight
    let diamter: SpaceRocketDiameter
    let engines: SpaceRocketEngines
    let firstStage: SpaceRocketFirstStage
    let secondStage: SpaceRocketSecondStage
    let landingLegs: SpaceRocketLandingLegs
    let payloadWeight: [SpaceRocketPayloadWeight]
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

    private enum CodingKeys: String, CodingKey {
        case height = "height"
        case diamter = "diameter"
        case engines = "engines"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case landingLegs = "landing_legs"
        case payloadWeight = "payload_weights"
        case flickImages = "flickr_images"
        case name = "name"
        case type = "type"
        case active = "active"
        case stages = "stages"
        case boosters = "boosters"
        case costPerLaunch = "cost_per_launch"
        case successratePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country = "country"
        case company = "company"
        case description = "description"
        case wikipedia = "wikipedia"
    }
}

struct SpaceRocketDiameter: Decodable {
    let meters: Double?
    let feet: Double?
}

struct SpaceRocketHeight: Decodable {
    let meters: Double?
    let feet: Double?
}

struct SpaceRocketMass: Decodable {
    let kg: Double?
    let lb: Double?
}

struct SpaceRocketFirstStage: Decodable {
    let thrustSeaLevel: SpaceRocketThrust
    let thrustVacuum: SpaceRocketThrust
    let reusable: Bool
    let engines: Int?
    let fuelAmountTons: Double
    let burnTimeSeconds: Double?

    private enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable = "reusable"
        case engines = "engines"
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSeconds = "burn_time_sec"
    }
}

struct SpaceRocketSecondStage: Decodable {
    let thrust: SpaceRocketThrust
    let payloads: SpaceRocketPayloads
    let reusable: Bool
    let engines: Int?
    let fueldAmountTons: Double?
    let burnTimeSeconds: Double?

    private enum CodingKeys: String, CodingKey {
        case thrust = "thrust"
        case payloads = "payloads"
        case reusable = "reusable"
        case engines = "engines"
        case fueldAmountTons = "fuel_amount_tons"
        case burnTimeSeconds = "burn_time_sec"
    }
}


struct SpaceRocketThrust: Decodable {
    let kN: Double
    let lbf: Double
}

struct SpaceRocketPayloads: Decodable {
    let compositeFairing: SpaceRocketFairing
    let option: String

    private enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option = "option_1"
    }
}

struct SpaceRocketFairing: Decodable {
    let height: SpaceRocketHeight
    let diameter: SpaceRocketDiameter
}

struct SpaceRocketEngines: Decodable {
    let isp: SpaceEngineIsp
    let thrustSeaLevel: SpaceRocketThrust
    let thrustVacuum: SpaceRocketThrust
    let number: Int
    let tupe: String
    let version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant: String
    let secondPropellant: String
    let thrustToWeight: Double

    private enum CodingKeys: String, CodingKey {
        case isp = "isp"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number = "number"
        case tupe = "type"
        case version = "version"
        case layout = "layout"
        case engineLossMax = "engine_loss_max"
        case propellant = "propellant_1"
        case secondPropellant = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

struct SpaceEngineIsp: Decodable {
    let seaLevel: Double
    let vacuum: Double

    private enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum = "vacuum"
    }
}

struct SpaceRocketLandingLegs: Decodable {
    let number: Int
    let material: String?
}

struct SpaceRocketPayloadWeight: Decodable {
    let id: String
    let name: String
    let kg: Double
    let lb: Double
}

