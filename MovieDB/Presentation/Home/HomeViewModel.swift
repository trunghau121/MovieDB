//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by 60156720 on 10/21/25.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: BaseViewModel<HomeNavigationEvent> {
    @Published var trending: [Movie] = []
    var repository: MovieRepositoryImp
    var trendingUseCase: TrendingUseCase
    
    override init() {
        repository = MovieRepositoryImp()
        trendingUseCase = TrendingUseCase(repository: repository)
    }
    
    func loadTrending() {
        performAsyn(
            operation: { try await self.trendingUseCase.execute(language: "en") },
            onSuccess: { results in
                self.trending = results
            }
        )
    }
    
    func didSelect(_ movieId: Int) {
        navigate(.openDetail(movieId: movieId))
    }
}
