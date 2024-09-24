//
//  ContentView.swift
//  spaceX
//
//  Created by Максим Жуин on 30.07.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    private let infoView = InformationView()
    @State var isSelected = true

    var body: some View {
        NavigationView {
            ZStack {
                AsyncImage(url: URL(string: "https://imgur.com/azYafd8.jpg")) { image in
                    if let image = image.image {
                        image.resizable()
                    }
                }
                .frame(
                    minWidth: 0,
                    idealWidth: 500,
                    maxWidth: 600,
                    minHeight: 0,
                    idealHeight: 600,
                    maxHeight: 950
                )
                .edgesIgnoringSafeArea(.top)
                .sheet(isPresented: $isSelected, content: {
                    InformationView()
                        .frame(
                            minWidth: 0,
                            idealWidth: 450,
                            maxWidth: 500,
                            minHeight: 0,
                            idealHeight: 450,
                            maxHeight: 950
                        )
                        .background(.black)
                        .cornerRadius(14.0)
                        .presentationDetents([.fraction(0.7)])
                        .ignoresSafeArea()
                })
                .interactiveDismissDisabled(true)
            }
        }
        .onAppear(perform: {
            Task(priority: .high) {
                let url =  "https://api.spacexdata.com/v4/rockets"
                let networkService = NetworkService.shared
                let decoderService = DecoderService()
                let dataSource = DataSourceService(networkService: networkService, decoderService: decoderService)
                dataSource.fetchData(urlString: url) { result in
                    switch result {
                    case .success(let responseModel):
                        print(responseModel.count)
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
                }
            }
        })
        .statusBarHidden()
    }

}

#Preview {
    ContentView()
}


//private func addItem() {
//    withAnimation {
//        let newItem = Item(context: viewContext)
//        newItem.timestamp = Date()
//
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//}
//
//private func deleteItems(offsets: IndexSet) {
//    withAnimation {
//        offsets.map { items[$0] }.forEach(viewContext.delete)
//
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//}
