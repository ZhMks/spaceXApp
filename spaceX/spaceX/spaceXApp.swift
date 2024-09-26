//
//  spaceXApp.swift
//  spaceX
//
//  Created by Максим Жуин on 30.07.2024.
//

import SwiftUI

@main
struct spaceXApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        var sampleModel = ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "NameFirst", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 14.0, lb: 16.0))
        WindowGroup {
            ContentView(selectedModel: sampleModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
