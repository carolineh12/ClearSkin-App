//
//  SkinNews.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/15/24.
//

import SwiftUI

struct NewsView: View {
    
    @State private var stuff = SkinStuff.examples()
    @State private var news = MedicalNews.examples()
    @State private var collection = Collection.examples()
    @State private var searchTerm = ""
    
    var filteredStuff: [SkinStuff] {
        guard !searchTerm.isEmpty else {return stuff}
        return stuff.filter {
            $0.name.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    var filteredNews: [MedicalNews] {
        guard !searchTerm.isEmpty else {return news}
        return news.filter {
            $0.name.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    var filteredCollection: [Collection] {
        guard !searchTerm.isEmpty else {return collection}
        return collection.filter {
            $0.name.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    var body: some View {
        NavigationStack {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        HStack {
                            Text("")
                                .padding(2)
                        }
                        HStack {
                            Text("New Products")
                                .bold()
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                                .padding([.leading])
                            Spacer()
                        }
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(filteredStuff) {stuff in
                                    SkinStuffCardView(stuff: stuff)
                                }
                            }
                        }
                        .padding(10)
                        .frame(height: 200)
                        
                        HStack {
                            Text("Medical News")
                                .font(.title)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .padding([.leading])
                            Spacer()
                        }
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(filteredNews) {news in
                                    MedicalNewsCardView(news: news)
                                        .padding([.bottom, .trailing], 10)
                                        .padding([.leading, .leading], 20)
                                }
                            }
                        }
                        .padding(10)
                        .frame(height: 250)
                        
                        HStack {
                            Text("Collection")
                                .bold()
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                                .padding([.leading])
                            Spacer()
                        }
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(filteredCollection) {collection in
                                    CollectionCardView(collection: collection)
                                }
                            }
                        }
                        .padding(10)
                        .frame(height: 200)
                    }
                }
            }
            .navigationTitle("Skin News")
            .searchable(text: $searchTerm, prompt: "Search Topic")

        }
      //  .navigationTitle("Skin News")
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

