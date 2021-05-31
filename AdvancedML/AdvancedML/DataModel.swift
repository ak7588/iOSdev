//
//  DataModel.swift
//  AdvancedML
//
//  Created by Amina on 5/31/21.
//

import Foundation

struct DataModel {
    
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"

    let parameters : [String:String] = [
    "format" : "json",
    "action" : "query",
    "prop" : "extracts",
    "exintro" : "",
    "explaintext" : "",
    "titles" : flowerName,
    "indexpageids" : "",
    "redirects" : "1",
    ]

}
