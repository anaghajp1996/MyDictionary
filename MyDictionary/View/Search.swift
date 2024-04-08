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
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search", text: $searchText)
                        .textInputAutocapitalization(.never)
                }
                Divider()
                Button(action: {
                    navigate = true
                }, label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                .padding()
                Spacer()
            }
            .padding(32)
            .background(Color.orange.opacity(0.1))
            .foregroundStyle(.orange)
            .navigationDestination(isPresented: $navigate, destination: {
                Word()
            })
        }
        .tint(.orange)
    }
}

#Preview {
    Search()
}
