//
//  Word.swift
//  MyDictionary
//
//  Created by Anagha K J on 07/04/24.
//

import SwiftUI

struct Word: View {
    var word: WordModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView {
                HStack {
                    Text(word.phonetics.first?.text ?? "")
                    if let audioLink = word.phonetics.first?.audio {
                        Button(action: {
                            // TODO: speak
                        }, label: {
                            Image(systemName: "speaker.wave.2.circle.fill")
                        })
                    }
                    Spacer()
                }
                .font(.title)
                .fontWeight(.bold)
                if let origin = word.origin {
                    Section(title: "Origin", description: origin)
                }
                ForEach(word.meanings, id: \.partOfSpeech) { meaning in
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(meaning.partOfSpeech)
                                .fontWeight(.bold)
                                .italic()
                                .font(.title3)
                            if let definition = meaning.definitions.first {
                                Text(definition.definition ?? "")
                                if let example = definition.example {
                                    Section(title: "Example", description: example)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.orange.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Spacer()
            }
            .foregroundStyle(.orange)
            .padding(32)
            .background(.orange.opacity(0.2))
        }
        .toolbarBackground(.automatic, for: .navigationBar)
    }
}

#Preview {
    Word(word: WordModel(phonetic: "həˈləʊ",
                         origin: "early 19th century: variant of earlier hollo ; related to holla.",
                         meanings: [
                             Meaning(partOfSpeech: "exclamation",
                                     definitions: [
                                         Definition(definition: "used as a greeting or to begin a phone conversation.",
                                                    example: "hello there, Katie!",
                                                    synonyms: ["opposite"],
                                                    antonyms: ["synonym"])
                                     ]),
                             Meaning(partOfSpeech: "noun",
                                     definitions: [
                                         Definition(definition: "an utterance of ‘hello’; a greeting.",
                                                    example: "she was getting polite nods and hellos from people",
                                                    synonyms: ["bye"],
                                                    antonyms: ["hi"])
                                     ])
                         ],
                         phonetics: [
                             Phonetic(text: "həˈləʊ", audio: "//ssl.gstatic.com/dictionary/static/sounds/20200429/hello--_gb_1.mp3")
                         ]))
}

struct Section: View {
    var title: String
    var description: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .textCase(.uppercase)
                .fontWeight(.bold)
            Divider()
            Text(description)
                .font(.headline)
                .multilineTextAlignment(.leading)
        }
    }
}
