//
//  Search.swift
//  MyDictionary
//
//  Created by Anagha K J on 07/04/24.
//

import SwiftUI

struct Search: View {
    @State var searchText = ""
    @State var navigate = false
    var wordVM = WordVM()
    @State var word: [WordModel?]?
    @State var isLoading = false
    @State var shake = false
    @State var showError = false
    var errorMessage = "Please check the spelling and try again!"
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search", text: $searchText)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                .offset(x: shake ? -10 : 0)
                Divider()
                Button(action: {
                    showError = false
                    if searchText.isEmpty {
                        shake = true
                        withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                            shake = false
                        }
                    } else {
                        Task {
                            if let wordResult = await wordVM.search(word: searchText) {
                                word = wordResult
                                navigate = true
                            } else {
                                showError = true
                            }
                        }
                    }
                }, label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                .padding()
                if showError {
                    Text(showError ? errorMessage : "")
                        .foregroundStyle(.red)
                        .italic()
                        .font(.headline)
                }
                Spacer()
            }
            .padding(32)
            .background(Color.orange.opacity(0.2))
            .foregroundStyle(.orange)
            .navigationDestination(isPresented: $navigate, destination: {
                if let firstWord = word?.first {
                    Word(word: firstWord!)
                }
            })
        }
        .tint(.orange)
    }
}

#Preview {
    Search()
}
