//
//  ContentView.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import SwiftUI
//import Kingfisher

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("API Key: \(viewModel.apiKey) \n Base Url: \(viewModel.baseUrl)")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
