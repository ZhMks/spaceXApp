//
//  ContentView.swift
//  spaceX
//
//  Created by Максим Жуин on 30.07.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isSelected = true
    @State private var modelsArray: [ResponseModel] = []
    @State private var isLoading = false
    @State var selectedModel: ResponseModel

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
                    ZStack {
                        InformationView(responseModel: $selectedModel)
                                .frame(
                                    minWidth: 0,
                                    idealWidth: 450,
                                    maxWidth: 500,
                                    minHeight: 0,
                                    idealHeight: 600,
                                    maxHeight: 950
                                )
                                .background(.black)
                                .cornerRadius(14.0)
                                .presentationDetents([.fraction(0.7)])
                                .ignoresSafeArea()
                                .interactiveDismissDisabled(true)
                        TabView {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.red)
                                .padding(.top,40)
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.yellow)
                                .padding(.top, 40)
                        }
                        .background(.gray)
                        .zIndex(1)
                        .frame(width: 120, height: 30)
                        .cornerRadius(14.0)
                        .padding(.bottom, 30)
                        .padding(.top, 480)
                    }
                })
            }
        }
        .onAppear(perform: {
            Task(priority: .high) {
                isLoading = true
                let url =  "https://api.spacexdata.com/v4/rockets"
                let networkService = NetworkService.shared
                let decoderService = DecoderService()
                let dataSource = DataSourceService(networkService: networkService, decoderService: decoderService)
                dataSource.fetchData(urlString: url) { result in
                    switch result {
                    case .success(let responseModel):
                        self.modelsArray = responseModel
                        isLoading = false
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
    ContentView(selectedModel: ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "Falcon_9", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 12.0, lb: 15.0)))
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
