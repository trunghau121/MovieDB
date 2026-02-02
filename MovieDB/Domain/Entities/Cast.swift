//
//  Cast.swift
//  MovieDB
//
//  Created by 60156720 on 1/23/26.
//

public struct Cast: Identifiable, Hashable, Codable {
    public let adult: Bool
    public let castId: Int
    public let character: String
    public let creditId: String
    public let gender: Int
    public let id: Int
    public let knownForDepartment: String
    public let name: String
    public let order: Int
    public let originalName: String
    public let popularity: Double
    public let profilePath: String
    public let biography: String
    public let homepage: String
    public let placeOfBirth: String
    public let birthday: String
    
    init(adult: Bool, castId: Int, character: String, creditId: String, gender: Int, id: Int, knownForDepartment: String, name: String, order: Int, originalName: String, popularity: Double, profilePath: String, biography: String, homepage: String, placeOfBirth: String, birthday: String) {
        self.adult = adult
        self.castId = castId
        self.character = character
        self.creditId = creditId
        self.gender = gender
        self.id = id
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.order = order
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.biography = biography
        self.homepage = homepage
        self.placeOfBirth = placeOfBirth
        self.birthday = birthday
    }
    
    static let placeholder: [Self] = (1..<11).map { index in
            .init(
                adult: false,
                castId: 0,
                character: "Kaguya (voice) Yuko Natsuyoshi",
                creditId: "     ",
                gender: 0,
                id: index,
                knownForDepartment: "     ",
                name: "Yuko Natsuyoshi Yuko Natsuyoshi",
                order: 0,
                originalName: "     ",
                popularity: 0,
                profilePath: "/62JhZDG70JAzht71e1B0Y7Ny14r.jpg",
                biography: "After cracking the biggest case in Zootopia's history, rookie cops Judy Hopps and Nick Wilde find themselves on the twisting trail of a great mystery when Gary De'Snake arrives and turns the animal metropolis upside down. To crack the case, Judy and Nick must go undercover to unexpected new parts of town, where their growing partnership is tested like never before.",
                homepage: "",
                placeOfBirth: "             ",
                birthday: "          ",
            )
    }
}
