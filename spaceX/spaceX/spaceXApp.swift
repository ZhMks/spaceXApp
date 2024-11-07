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
        @State var heightState: HeightModelState = .ft
        @State var massState: MassModelState = .kg
        @State var diameterState: DiameterModelState = .ft
        WindowGroup {
            ContentView(onboardingModel: responseModel, isPresented: true, isLauncesActive: false, dataSource: dataSource, isSettingsActive: false, heighModelState: heightState, massModelState: massState, diameterModelState: diameterState)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
