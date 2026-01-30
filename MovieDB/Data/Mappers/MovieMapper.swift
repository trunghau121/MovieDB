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
            backdropPath: "\(Enviroment.photo780Url + (self.backdropPath ?? "-1"))",
            posterPath: "\(Enviroment.photo500Url + (self.posterPath ?? "-1"))",
            voteAverage: self.voteAverage ?? 0,
            releaseDate: self.releaseDate ?? "",
            overview: self.overview ?? "",
            runtime: self.runtime ?? 0,
            genres: self.genres ?? []
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

extension CastDTO {
    func toDomain() -> Cast {
        return Cast(
            adult: self.adult ?? false,
            castId: self.castId ?? 0,
            character: self.character ?? "",
            creditId: self.creditId ?? "",
            gender: self.gender ?? 0,
            id: self.id ?? 0,
            knownForDepartment: self.knownForDepartment ?? "",
            name: self.name ?? "",
            order: self.order ?? 0,
            originalName: self.originalName ?? "",
            popularity: self.popularity ?? 0,
            profilePath: "\(Enviroment.photo200Url + (self.profilePath ?? ""))"
        )
    }
}

extension CastListDTO {
    func toDomain() -> [Cast] {
        (cast ?? []).map {
            $0.toDomain()
        }
    }
}

extension TrailerDTO {
    func toDomain() -> Trailer {
        return Trailer(
            id: self.id ?? "",
            iso31661: self.iso31661 ?? "",
            iso6391: self.iso6391 ?? "",
            key: self.key ?? "",
            name: self.name ?? "",
            official: self.official ?? false,
            publishedAt: self.publishedAt ?? "",
            site: self.site ?? "",
            size: self.size ?? 0,
            type: self.type ?? ""
        )
    }
}

extension TrailerListDTO {
    func toDomain() -> [Trailer] {
        (videos ?? []).map {
            $0.toDomain()
        }
    }
}

extension PhotoDTO {
    func toDomain() -> Photo {
        return Photo(
            aspectRatio: self.aspectRatio ?? 0,
            height: self.height ?? 0,
            iso3166_1: self.iso3166_1 ?? "",
            iso639_1: self.iso639_1 ?? "",
            filePath: self.filePath ?? "-1",
            voteAverage: self.voteAverage ?? 0,
            voteCount: self.voteCount ?? 0,
            width: self.width ?? 0
        )
    }
}

extension PhotoListDTO {
    func toDomain() -> PhotoList {
        return PhotoList(
            id: self.id ?? 0,
            backdrops: (self.backdrops ?? []).map {
                $0.toDomain()
            },
            logos: (self.logos ?? []).map {
                $0.toDomain()
            },
            posters: (self.posters ?? []).map {
                $0.toDomain()
            }
        )
    }
}

