//
//  DetailInfoView.swift
//  spaceX
//
//  Created by Максим Жуин on 10.10.2024.
//
import SwiftUI
import Combine

struct DetailInfoView: View {

    var model: ResponseModel

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .foregroundStyle(.green)
    }
}


#Preview {
    var responseModel = ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "NameFirst", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 144.0, lb: 152.0))
    DetailInfoView(model: responseModel)
}
