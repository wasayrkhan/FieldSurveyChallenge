//
//  FieldSurvey.swift
//  Field Survey
//
//  Created by Wasay Khan on 4/29/20.
//  Copyright © 2020 Wasay Khan. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct Observation: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
}

struct Observations: Codable {
    var status: String
    var observations: [Observation]
}
