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
    @State private var isLauncesActive = false
    @State private var dataSource: DataSourceService?


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
                .sheet(isPresented: $isPresented, onDismiss: {
                    sheetViewIsDismissed()
                }) {
                    NavigationStack {
                        TabView(selection: $viewIndex) {
                            ForEach(0..<onboardingModel.count, id: \.self) { index in
                                ScrollView(.vertical) {
                                    DetailInfoView(model: onboardingModel[index],
                                                   heightState: .feet,
                                                   diameterState:.feet,
                                                   massState: .kg)
                                    .tag(index)
                                }
                            }
                        }
                        .background(.black)
                        .navigationDestination(isPresented: $isLauncesActive) {
                            if let dataSource = dataSource {
                                LaunchesView(model: onboardingModel[viewIndex], dataSource: dataSource)
                            }
                        }
                        .onTapGesture {
                            isLauncesActive.toggle()
                        }
                    }
                    .presentationDetents([.fraction(0.6)])
                    .tabViewStyle(.page)
                    .background(.black)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            createDataSource()
            Task(priority: .high) {
                fetchData()
            }
        }
        .statusBarHidden()
    }

    func sheetViewIsDismissed() {

    }

    private func createDataSource() {
        let networkService = NetworkService()
        let decoderService = DecoderService()
        let dataSource = DataSourceService(networkService: networkService, decoderService: decoderService)
        self.dataSource = dataSource
    }

    func fetchData() {
        if let dataSource = dataSource {
            dataSource.fetchRocketsData(urlString: .rocketsUrl) { result in
                switch result {
                case .success(let success):
                    onboardingModel = success
                    for model in onboardingModel {
                        print("ModelRocket id: \(model.id)")
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
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
