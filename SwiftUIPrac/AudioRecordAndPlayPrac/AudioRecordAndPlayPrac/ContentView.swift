//
//  ContentView.swift
//  AudioRecordAndPlayPrac
//
//  Created by SUCHAN CHANG on 2023/10/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isRecording = false
    @State private var audioRecorder: AVAudioRecorder!
    @State private var audioPlayer: AVAudioPlayer?
    @State private var audioURL: URL?
    
    var body: some View {
        VStack {
            Button(action: {
                if isRecording {
                    stopRecording()
                } else {
                    startRecording()
                }
                isRecording.toggle()
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .padding()
                    .background(isRecording ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                if let audioURL = audioURL {
                    playAudio(url: audioURL)
                }
            }) {
                Text("Play Recorded Audio")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            setupAudioRecorder()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func setupAudioRecorder() {
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(.playAndRecord, options: .defaultToSpeaker)
                try audioSession.setActive(true)
                audioSession.requestRecordPermission { allowed in
                    if allowed {
                        do {
                            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                            
                            audioURL = documentDirectory.appendingPathComponent("recordedAudio")
                            
                            let settings = [
                                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                                AVSampleRateKey: 44100,
                                AVNumberOfChannelsKey: 1,
                                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                            ]
                            
                            audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
                        } catch {
                            print("Error setting up audio recorder: \(error.localizedDescription)")
                        }
                    } else {
                        print("Permission to record audio denied")
                    }
                }
            } catch {
                print("Error setting up audio session: \(error.localizedDescription)")
            }
        }
        
        func startRecording() {
            do {
                try audioRecorder.record()
            } catch {
                print("Error starting recording: \(error.localizedDescription)")
            }
        }
        
        func stopRecording() {
            audioRecorder.stop()
        }
        
        func playAudio(url: URL) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
}
