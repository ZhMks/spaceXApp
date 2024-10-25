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

    var responseModel: [ResponseModel] = []


    var body: some Scene {
        let networkService = NetworkService()
        let decoderService = DecoderService()
        let dataSource = DataSourceService(networkService: networkService, decoderService: decoderService)
        WindowGroup {
            ContentView(onboardingModel: responseModel, isPresented: true, isLauncesActive: false, dataSource: dataSource, heightState: .feet, massState: .kg, diameterState: .feet, isSettingsActive: false)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
