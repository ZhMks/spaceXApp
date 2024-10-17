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
        WindowGroup {
            ContentView(onboardingModel: responseModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
