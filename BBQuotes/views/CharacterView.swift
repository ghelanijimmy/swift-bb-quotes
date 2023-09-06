//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Jimmy Ghelani on 2023-09-06.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Image("breakingbad")
                    .resizable()
                    .scaledToFit()
                ScrollView {
                    VStack {
                        Image("jessepinkman")
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(width: geo.size.width / 1.2, height: geo.size.height / 1.7)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 60)
                    
                    VStack(alignment: .leading) {
                        Group {
                            Text("Jesse Pinkman")
                                .font(.largeTitle)
                            
                            Text("Portrayed By: Aaron Paul")
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        Group {
                            Text("Jesse Pinkman Character Info")
                                .font(.title2)
                            
                            Text("Born: 09-24-1984")
                        }
                        
                        Divider()
                        
                        Group {
                            Text("Occupations:")
                            
                            ForEach(0..<3) {i in
                                    Text("• Some Occupation \(i)")
                                    .font(.subheadline)
                            }
                        }
                        
                        Divider()
                        
                        Group {
                            Text("Nicknames:")
                            
                            ForEach(0..<3) {i in
                                    Text("• Some Nickname \(i)")
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
    CharacterView()
        .preferredColorScheme(.dark)
}
