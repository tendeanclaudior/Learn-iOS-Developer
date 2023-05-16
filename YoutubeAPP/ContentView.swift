//
//  ContentView.swift
//  YoutubeAPP
//
//  Created by Claudio Tendean on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Beranda")
                    }
                Home()
                    .tabItem{
                        Image(systemName: "paperplane.fill")
                        Text("Exsplorasi")
                    }
                Home()
                    .tabItem{
                        Image(systemName: "tray.fill")
                        Text("Subscription")
                    }
                Home()
                    .tabItem{
                        Image(systemName: "envelope.fill")
                        Text("Kotak Masu")
                    }
                Home()
                    .tabItem{
                        Image(systemName: "play.rectangle.fill")
                        Text("Koleksi")
                    }
            }
            .accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View {
        NavigationView{
            Konten()
            
                .navigationBarItems(
                    leading:
                        HStack{
                            Button(action: {print("Hello World 1")}) {
                                Image("LogoYT")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 90)
                            }
                        },
                    trailing:
                        HStack(spacing: 15){
                            Button(action: {print("Hello World 2")}) {
                                Image(systemName: "tray.full")
                                    .foregroundColor(Color.secondary)
                            }
                            
                            Button(action: {print("Hello World 3")}) {
                                Image(systemName: "video.fill")
                                    .foregroundColor(Color.secondary)
                            }
                            
                            Button(action: {print("Hello World 4")}) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.secondary)
                            }
                            
                            Button(action: {print("Hellow World 5")}) {
                                Image("profile")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                            }
                        }
                ).navigationBarTitle("", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Konten : View {
    var body: some View {
        List{
            
            CellKonten(imageKonten: "Content1", profileKonten: "profile", judul: "Tutorial Internship #1", deskripsi: "Ini adalah deskripsi video kita - 1000x ditonton - 9 Jam yang lalu", durasi: "10 : 10")
            
            CellKonten(imageKonten: "Content2", profileKonten: "profile", judul: "Tutorial Internship #2", deskripsi: "Ini adalah deskripsi video kita - 900x ditonton - 9 Jam yang lalu", durasi: "10 : 10")
            
            CellKonten(imageKonten: "Content1", profileKonten: "profile", judul: "Tutorial Internship #3", deskripsi: "Ini adalah deskripsi video kita - 300x ditonton - 9 Jam yang lalu", durasi: "10 : 10")
            
        }
    }
}

struct CellKonten : View {
    
    var imageKonten : String;
    var profileKonten : String;
    var judul : String;
    var deskripsi : String;
    var durasi : String;
    
    var body: some View {
        // Konten 1
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(imageKonten)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text(durasi)
                    .padding(.all, 5)
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.leading, 5)
                    .padding(.bottom, 5)
            }
            
            HStack(spacing: 20){
                Image(profileKonten)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text(judul).font(.headline)
                    HStack{
                        Text(deskripsi).font(.caption)
                    }
                }
                Spacer()
                Image(systemName: "list.bullet")
            }
        }
    }
}
