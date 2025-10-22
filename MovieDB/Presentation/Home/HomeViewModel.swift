//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var apiKey: String = ""
    @Published var baseUrl: String = ""
    
    init() {
        Task {
            await getData()
        }
    }
    
    func getData() async {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
        } catch {}
        
        apiKey = Enviroment.apiKey
        baseUrl = Enviroment.baseUrl
    }
    
}
