//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Jimmy Ghelani on 2023-09-06.
//

import SwiftUI

struct QuoteView: View {
    
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    let show: String
    
    var body: some View {
        GeometryReader {geo in
            ZStack {
                Image(show.lowerNoSpaces)
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack{
                    VStack {
                        Spacer(minLength: 140)
                        
                        switch viewModel.status {
                        case .success(let data):
                            Text("\"\(data.quote.quote) \"")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(.horizontal)
                                .minimumScaleFactor(0.5)
                            
                            ZStack(alignment: .bottom) {
                                
                                AsyncImage(url: data.character.images[0]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                                
                                
                                Text(data.character.name)
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial.opacity(0.75))
                            }
                            .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                            .clipShape(RoundedRectangle(cornerRadius: 80))
                            
                        case .fetching:
                            ProgressView()
                        default:
                            EmptyView()
                        }
                        Spacer()
                    }
                    Button {
                        Task {
                            await viewModel.getData(for: show)
                        }
                    } label:{
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color("\(show.noSpaces)Button"))
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .shadow(color: Color("\(show.noSpaces)Shadow"), radius: 5)
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
    QuoteView(show: Constants.bbName)
        .preferredColorScheme(.dark)
}
