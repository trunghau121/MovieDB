//
//  MovieManager.swift
//  MovieDB
//
//  Created by 60156720 on 1/15/26.
//

import Foundation

public class MovieManager: ObservableObject {
    @Published var movies: [Movie] = []
    private let saveKey = "MoviesKey"
    static let shared = MovieManager()
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let saveData = UserDefaults.standard.data(forKey: saveKey),
           let decodedMovies = try? JSONDecoder().decode([Movie].self, from: saveData) {
            movies = decodedMovies
        }
    }
    
    func save(movie: Movie) {
        movies.append(movie)
        save()
    }
    
    func remove(movie: Movie) {
        movies.removeAll { item in
            item.id == movie.id
        }
        save()
    }
    
    func isFavorite(movieId: Int) -> Bool {
        movies.contains { item in
            item.id == movieId
        }
    }
    
    private func save() {
        if let encodedMovies = try? JSONEncoder().encode(movies) {
            UserDefaults.standard.set(encodedMovies, forKey: saveKey)
        }
    }
    
    
}
