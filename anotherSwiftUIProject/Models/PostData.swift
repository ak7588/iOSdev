//
//  PostData.swift
//  anotherSwiftUIProject (iOS)
//
//  Created by Amina on 5/13/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable {
    var id: String {
        return ObjectID
    }
    let ObjectID: String
    let points: Int
    let title: String
    let url: String?
}
