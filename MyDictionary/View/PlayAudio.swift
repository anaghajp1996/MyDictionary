//
//  PlayAudio.swift
//  MyDictionary
//
//  Created by Anagha K J on 07/04/24.
//

import AVFoundation
import SwiftUI

struct PlayAudio: View {
    var audioLink: String
    @State var audioPlayer: AVPlayer?
    var body: some View {
        Button(action: {
            if let url = URL(string: audioLink) {
                audioPlayer = AVPlayer(url: url)
                audioPlayer?.play()
            }
        }, label: {
            Image(systemName: "speaker.wave.2.circle.fill")
        })
    }
}
