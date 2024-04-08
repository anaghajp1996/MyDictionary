//
//  WordModel.swift
//  MyDictionary
//
//  Created by Anagha K J on 07/04/24.
//

import Foundation

struct WordModel: Decodable {
    var word: String?
    var phonetic: String?
    var origin: String?
    var meanings: [Meaning]
    var phonetics: [Phonetic]
}

struct Meaning: Decodable {
    var partOfSpeech: String
    var definitions: [Definition]
}

struct Definition: Decodable {
    var definition: String?
    var example: String?
    var synonyms: [String]
    var antonyms: [String]
}

struct Phonetic: Decodable {
    var text: String?
    var audio: String?
}
