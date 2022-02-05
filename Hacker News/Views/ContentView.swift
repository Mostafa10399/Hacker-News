//
//  ContentView.swift
//  Hacker News
//
//  Created by Mostafa Mahmoud on 2/2/22.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var netWorkManger = NetworkManger()
    var body: some View {
        NavigationView
        {
            
            List(netWorkManger.posts,  rowContent:
                    { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack
                    {
                        Text("\(post.points)")
                        Text("\(post.title)")
                    }
                    
                }
                
                
            }
            )
            
                .navigationTitle("Hacker News")
            
        }
        
        .onAppear {
            netWorkManger.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


