//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Jimmy Ghelani on 2023-09-06.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        GeometryReader {geo in
            ZStack {
                Image(.breakingbad)
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    Spacer(minLength: 140)
                    
                    Text("\"You either run from things, or you face them, Mr. White.\"")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.horizontal)
                        .minimumScaleFactor(0.5)
                    
                    ZStack(alignment: .bottom) {
                        Image(.jessepinkman)
                            .resizable()
                            .scaledToFill()
                        
                        Text("Jesse Pinkman")
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial.opacity(0.75))
                    }
                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                    .clipShape(RoundedRectangle(cornerRadius: 80))
                    
                    Spacer()
                    
                    Button {
                        //
                    } label:{
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.breakingBadGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .shadow(color: .breakingBadYellow, radius: 5)
                    }
                    
                    Spacer(minLength: 180)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView()
        .preferredColorScheme(.dark)
}
