//
//  MovieMapper.swift
//  MovieDB
//
//  Created by 60156720 on 12/10/25.
//

extension MovieDTO {
    func toDomain() -> Movie {
        return Movie(
            id: self.id ?? -1,
            title: self.title ?? "",
            backdropPath: self.backdropPath ?? "-1",
            posterPath: self.posterPath ?? "-1",
            voteAverage: self.voteAverage ?? 0,
            releaseDate: self.releaseDate ?? "",
            overview: self.overview ?? ""
        )
    }
}

extension MovieListDTO {
    func toDomain() -> [Movie] {
        (data ?? []).map {
            $0.toDomain()
        }
    }
}
