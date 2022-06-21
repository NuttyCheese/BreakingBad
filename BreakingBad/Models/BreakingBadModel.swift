//
//  BreakingBadModel.swift
//  BreakingBad
//
//  Created by Борис Павлов on 21.06.2022.
//

import Foundation

enum Link: String {
    case actorURL = "https://breakingbadapi.com/api/characters"
    case seriesURL = "https://breakingbadapi.com/api/episodes"
}

struct ActorModel: Codable {
    let name: String
    let nickname: String
    let portrayed: String
    let occupation: [String]
    let img: String
}

struct EpisodesModel: Codable {
    let title: String
    let episode: String
    let air_date: String
    let season: String
    let characters: [String]
    
}
