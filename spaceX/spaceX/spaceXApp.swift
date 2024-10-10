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
        let viewModel = InformationViewModel(state: .kg)
        WindowGroup {
            ContentView(viewModel: viewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
