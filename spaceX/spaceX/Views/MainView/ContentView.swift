//
//  ContentView.swift
//  spaceX
//
//  Created by Максим Жуин on 30.07.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State var onboardingModel: [ResponseModel]
    @State private var isPresented = true
    @State private var viewIndex = 0


    var body: some View {
        ZStack {
            if !onboardingModel.isEmpty {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<onboardingModel[viewIndex].flickImages.count, id: \.self) { imgIndex in
                            let imageURL = URL(string: onboardingModel[viewIndex].flickImages[imgIndex])
                            AsyncImage(url: imageURL) { fetchedImage in
                                if let fetchedImage = fetchedImage.image {
                                    fetchedImage
                                        .resizable()
                                        .frame(width: 450)
                                }
                            }
                        }
                    }
                    .background(.clear)
                    .scrollIndicators(.hidden)
                }
                .padding(.top, 10)
                .sheet(isPresented: $isPresented) {
                    NavigationView {
                        TabView(selection: $viewIndex) {
                            ForEach(0..<onboardingModel.count, id: \.self) { index in
                                ScrollView(.vertical) {
                                    DetailInfoView(model: onboardingModel[index], heightState: .feet, diameterState:.feet, massState: .kg)
                                        .tag(index)
                                }
                            }
                        }
                        .background(.black)
                    }
                    .presentationDetents([.fraction(0.6)])
                    .tabViewStyle(.page)
                    .background(.black)
                }
            }
        }
        .onAppear {
            Task(priority: .high) {
                let networkService = NetworkService()
                let decoderService = DecoderService()
                let dataSource = DataSourceService(networkService: networkService, decoderService: decoderService)
                let urlString = "https://api.spacexdata.com/v4/rockets"
                dataSource.fetchData(urlString: urlString) { result in
                    switch result {
                    case .success(let success):
                        print("Executed here")
                        onboardingModel = success
                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
                }
            }
        }
        .statusBarHidden()
    }
}



#Preview {
    var responseModel: [ResponseModel] = []
    ContentView(onboardingModel: responseModel)
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
