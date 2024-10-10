//
//  ContentView.swift
//  spaceX
//
//  Created by Максим Жуин on 30.07.2024.
//

import SwiftUI
import CoreData

struct TabItem {
    let title: String
    let view: AnyView
}

struct ContentView: View {

    @ObservedObject var viewModel: InformationViewModel
    @State private var isPresented = true
    @State private var viewIndex = 0

    var body: some View {
        ZStack {
            if !viewModel.onboardingModel.isEmpty {
                if let imageUrl = viewModel.onboardingModel[viewIndex].flickImages.last {
                    AsyncImage(url: URL(string: imageUrl)) { fetchedImage in
                        if let fetchedImage = fetchedImage.image {
                            fetchedImage
                                .resizable()
                                .ignoresSafeArea()
                        }

                    }
                    .sheet(isPresented: $isPresented) {
                        TabView(selection: $viewIndex) {
                            ForEach(0..<viewModel.onboardingModel.count, id: \.self) { index in
                                DetailInfoView(model: viewModel.onboardingModel[index])
                            }
                        }
                        .presentationDetents([.fraction(0.7)])
                        .tabViewStyle(.page)
                        .background(.black)
                    }
                }
            }
        }
        .tabViewStyle(.page)
        .onAppear {
            Task(priority: .high) {
                self.viewModel.fetchData()
            }
        }
        .statusBarHidden()
    }
}



#Preview {
    var viewModel = InformationViewModel(state: .kg)
    ContentView(viewModel: viewModel)
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
