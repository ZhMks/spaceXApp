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
    @State var heightState: HeightModelState
    @State var massState: MassModelState
    @State var diameterState: DiameterModelState
    @State private var isSettingsActive: Bool


    init(onboardingModel: [ResponseModel], isPresented: Bool, viewIndex: Int = 0, isLauncesActive: Bool, dataSource: DataSourceService?, isSettingsActive: Bool, heighModelState: HeightModelState, massModelState: MassModelState, diameterModelState: DiameterModelState) {
        self.onboardingModel = onboardingModel
        self.isPresented = isPresented
        self.viewIndex = viewIndex
        self.isLauncesActive = isLauncesActive
        self.dataSource = dataSource
        self.isSettingsActive = isSettingsActive
        self.heightState = heighModelState
        self.massState = massModelState
        self.diameterState = diameterModelState
    }


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
                                    DetailInfoView(model: onboardingModel[viewIndex], heightState: $heightState, massState: $massState, diameterState: $diameterState, isSettingsActive: $isSettingsActive, isLaunchesActive: $isLauncesActive)
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
                        .sheet(isPresented: $isSettingsActive, content: {
                            SettingsView(heightState: $heightState, diameterState: $diameterState, massState: $massState)
                        })
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
                        print("ModelRocket id: \(model.name), diamter: \(model.diamter.feet)")
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}



struct ContentPreview: PreviewProvider {
    static var previews: some View {
        let responseModel: [ResponseModel] = []
        @State var isSettingsActive = false
        let networkservice = NetworkService()
        let decoderService = DecoderService()
        let dataSource: DataSourceService = DataSourceService(networkService: networkservice, decoderService: decoderService)
        @State var heightState: HeightModelState = .ft
        @State var massState: MassModelState = .kg
        @State var diamaterState: DiameterModelState = .ft
        ContentView(onboardingModel: responseModel, isPresented: true, isLauncesActive: false, dataSource: dataSource, isSettingsActive: false, heighModelState: heightState, massModelState: massState, diameterModelState: diamaterState)
    }
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
