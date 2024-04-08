//
//  WordVM.swift
//  MyDictionary
//
//  Created by Anagha K J on 07/04/24.
//

import Alamofire
import Foundation

class WordVM {
    private func callSearchWordAPI(word: String) async throws -> Data? {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
            )
            .validate()
            .responseData { response in
                switch response.result {
                case let .success(data):
                    continuation.resume(returning: data)
                case .failure(_):
                    continuation.resume(returning: nil)
                }
            }
        }
    }

    func search(word: String) async -> [WordModel]? {
        var wordResult: [WordModel]?
        do {
            if let wordData = try await callSearchWordAPI(word: word) {
                wordResult = try JSONDecoder().decode([WordModel].self, from: wordData)
            }
        }
        catch {}
        return wordResult
    }
}
