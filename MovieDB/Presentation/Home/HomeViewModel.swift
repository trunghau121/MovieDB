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
    private var repository: MovieRepositoryImp
    private var trendingUseCase: TrendingUseCase
    private var popularUseCase: PopularUseCase
    private var nowUseCase: NowUseCase
    private var soonUseCase: SoonUseCase
    private var movieTabTask: Task<Void, Never>? = nil
    @Published private(set) var trendingState: CollectionLoadingState<[Movie]> = .loading(placeholder: Movie.placeholder)
    @Published var movieTabState: CollectionLoadingState<[Movie]> = .loading(placeholder: Movie.placeholder)
    
    override init() {
        repository = MovieRepositoryImp()
        trendingUseCase = TrendingUseCase(repository: repository)
        popularUseCase = PopularUseCase(repository: repository)
        nowUseCase = NowUseCase(repository: repository)
        soonUseCase = SoonUseCase(repository: repository)
    }
    
    func loadTrending() {
        let language = LocalizableManager.shared.currentLanguage.rawValue
        performAsyn(
            operation: { try await self.trendingUseCase.execute(language: language) },
            onLoading: { loading in
                if loading {
                    self.trendingState = .loading(placeholder: Movie.placeholder)
                }
            },
            onSuccess: { results in
                if results.isEmpty {
                    self.trendingState = .empty
                } else {
                    self.trendingState = .loaded(content: results)
                }
            },
            onError: { error in
                self.trendingState = .error(error)
            }
        )
    }
    
    func loadMovieWithTab(tab: Tabs) {
        if movieTabTask != nil {
            movieTabTask?.cancel()
        }
        let language = LocalizableManager.shared.currentLanguage.rawValue
        movieTabTask = performAsyn(
            operation: {
                switch tab {
                case .popular:
                    try await self.popularUseCase.execute(language: language)
                case .now:
                    try await self.nowUseCase.execute(language: language)
                default:
                    try await self.soonUseCase.execute(language: language)
                }
            },
            onLoading: { loading in
                if loading {
                    self.movieTabState = .loading(placeholder: Movie.placeholder)
                }
            },
            onSuccess: { results in
                if results.isEmpty {
                    self.movieTabState = .empty
                } else {
                    self.movieTabState = .loaded(content: results)
                }
            },
            onError: { error in
                self.movieTabState = .error(error)
            }
        )
    }
    
    func didSelect(_ movieId: Int) {
        navigate(.openDetail(movieId: movieId))
    }
}
