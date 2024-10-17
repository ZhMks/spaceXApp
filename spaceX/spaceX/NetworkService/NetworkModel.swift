//
//  NetworkModel.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//


struct NetworkModel: Decodable {
    let height: NetworkRocketParam
    let diamter: NetworkRocketParam
    let firstStage: NetworkRocketFirstStage
    let secondStage: NetworkRocketSecondStage
    let payloadWeight: [NetworkRocketPayloadWeight]
    let flickImages: [String]
    let name: String
    let type: String
    let costPerLaunch: Double
    let successratePct: Double
    let firstFlight: String
    let country: String
    let company: String
    let description: String
    let mass: NetworkRocketMass
    let id: String

    private enum CodingKeys: String, CodingKey {
        case height = "height"
        case diamter = "diameter"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case payloadWeight = "payload_weights"
        case flickImages = "flickr_images"
        case name = "name"
        case type = "type"
        case costPerLaunch = "cost_per_launch"
        case successratePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country = "country"
        case company = "company"
        case description = "description"
        case mass = "mass"
        case id = "id"
    }
}

struct NetworkRocketParam: Decodable {
    let meters: Double?
    let feet: Double?
}

struct NetworkRocketMass: Decodable {
    let kg: Double?
    let lb: Double?
}

struct NetworkRocketFirstStage: Decodable {
    let engines: Int?
    let fuelAmountTons: Double
    let burnTimeSeconds: Double?

    private enum CodingKeys: String, CodingKey {
        case engines = "engines"
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSeconds = "burn_time_sec"
    }
}

struct NetworkRocketSecondStage: Decodable {
    let engines: Int?
    let fueldAmountTons: Double?
    let burnTimeSeconds: Double?

    private enum CodingKeys: String, CodingKey {
        case engines = "engines"
        case fueldAmountTons = "fuel_amount_tons"
        case burnTimeSeconds = "burn_time_sec"
    }
}

struct NetworkRocketPayloadWeight: Decodable {
    let id: String
    let name: String
    let kg: Double
    let lb: Double
}

