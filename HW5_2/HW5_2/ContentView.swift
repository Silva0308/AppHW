//
//  ContentView.swift
//  HW5_2
//
//  Created by MacBook Pro on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var news: [News] = []
    private var netwokrService = NetworkService()
    
    var body: some View {
        List(news) { news in
            VStack {
                Text(Helper.getDate(date: news.date))
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(Color.red)
                Text(news.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                
        }
        }
        .onAppear{
            netwokrService.getNews {
                (news) in self.news = news
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
