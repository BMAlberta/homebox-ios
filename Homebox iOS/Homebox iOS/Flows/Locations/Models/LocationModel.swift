//
//  LocationModel.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/26/24.
//

import Foundation


struct LocationTreeEntity: Decodable {
    let id: String
    let name: String
    let type: String
    let children: [LocationTreeEntity]?
}


struct LocationDetail: Decodable {
    let id: String
    let name: String
    let description: String
    let createdAt: String
    let updatedAt: String
    let children: [LocationDetail]?
    let parent: String?
}

struct LocationOverview: Decodable {
    let id: String
    let name: String
    let description: String
    let createdAt: String
    let updatedAt: String
    let itemCount: Int
}

typealias LocationTreeModel = [LocationTreeEntity]

