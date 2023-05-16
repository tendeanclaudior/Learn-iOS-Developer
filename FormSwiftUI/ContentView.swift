//
//  ContentView.swift
//  FormSwiftUI
//
//  Created by Claudio Tendean on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Form{
                // Section foto profile
                Section(){
                    NavigationLink(destination: About()) {
                        HStack{
                            Image("profile")
                                .resizable()
                                .frame(width:50, height:50)
                                .clipShape(Circle())
                            
                            // Nama dan Status
                            VStack(alignment:.leading) {
                                Text("Claudio Tendean").font(.headline)
                                Text("iOS Developer").font(.caption)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    }
                }
                
                // Section Pengaturan Umum
                Section(header: Text("Pengaturan Umum")) {
                    HStack(spacing: 20){
                        Image(systemName: "star.fill")
                            .frame(width: 35, height: 35)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        
                        Text("Pesan Berbintang")
                    }
                    
                    HStack(spacing: 20){
                        Image(systemName: "tv")
                            .frame(width: 35, height: 35)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        
                        Text("WhatsApp Web/Desktop")
                    }
                }
                
                // Section Pengaturan Akun
                Section(header: Text("Pengaturan Akun")) {
                    HStack(spacing: 20) {
                        Image(systemName: "person")
                            .frame(width: 35, height: 35)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        
                        Text("Akun")
                    }
                    
                    HStack(spacing: 20) {
                        Image(systemName: "phone.circle")
                            .frame(width: 35, height: 35)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        
                        Text("Chat")
                    }
                }
            }.navigationBarTitle("Setting")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct About : View {
    var body: some View {
        Text("Halaman About")
    }
}
