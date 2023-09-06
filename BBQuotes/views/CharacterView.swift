//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Jimmy Ghelani on 2023-09-06.
//

import SwiftUI

struct CharacterView: View {
    
    let show: String
    let character: Character
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Image(show.lowerNoSpaces)
                    .resizable()
                    .scaledToFit()
                ScrollView {
                    VStack {
                        AsyncImage(url: character.images.randomElement()) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }

                    }
                    .frame(width: geo.size.width / 1.2, height: geo.size.height / 1.7)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 60)
                    
                    VStack(alignment: .leading) {
                        Group {
                            Text(character.name)
                                .font(.largeTitle)
                            
                            Text("Portrayed By: \(character.portrayedBy)")
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        Group {
                            Text("\(character.name) Character Info")
                                .font(.title2)
                            
                            Text(character.birthday)
                        }
                        
                        Divider()
                        
                        Group {
                            Text("Occupations:")
                            
                            ForEach(character.occupations, id: \.self) {occupation in
                                    Text("• \(occupation)")
                                    .font(.subheadline)
                            }
                        }
                        
                        Divider()
                        
                        Group {
                            Text("Nicknames:")
                            if character.aliases.count > 0 {
                                ForEach(character.aliases, id: \.self) {alias in
                                    Text("• \(alias)")
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding([.leading, .bottom], 40)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(show: Constants.bbName, character: Constants.previewCharacter)
        .preferredColorScheme(.dark)
}
