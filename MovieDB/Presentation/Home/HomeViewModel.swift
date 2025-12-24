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
    @Published var movieTabs: [Movie] = []
    private var repository: MovieRepositoryImp
    private var trendingUseCase: TrendingUseCase
    private var popularUseCase: PopularUseCase
    private var nowUseCase: NowUseCase
    private var soonUseCase: SoonUseCase
    
    override init() {
        repository = MovieRepositoryImp()
        trendingUseCase = TrendingUseCase(repository: repository)
        popularUseCase = PopularUseCase(repository: repository)
        nowUseCase = NowUseCase(repository: repository)
        soonUseCase = SoonUseCase(repository: repository)
    }
    
    func loadTrending() {
        performAsyn(
            operation: { try await self.trendingUseCase.execute(language: "en") },
            onSuccess: { results in
                self.trending = results
            }
        )
    }
    
    func loadMovieWithTab(tab: Tabs) {
        performAsyn(
            operation: {
                switch tab {
                case .popular:
                    try await self.popularUseCase.execute(language: "en")
                case .now:
                    try await self.nowUseCase.execute(language: "en")
                default:
                    try await self.soonUseCase.execute(language: "en")
                }
            },
            onLoading: {_ in},
            onSuccess: { results in
                self.movieTabs = results
            },
            onError: {_ in}
        )
    }
    
    func didSelect(_ movieId: Int) {
        navigate(.openDetail(movieId: movieId))
    }
}
