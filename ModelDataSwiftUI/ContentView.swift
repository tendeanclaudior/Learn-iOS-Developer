//
//  ContentView.swift
//  ModelDataSwiftUI
//
//  Created by Claudio Tendean on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    
    //data baru
    
    let data : [DataModel] = [
        DataModel(id: 1, namaProduk: "Mobil Sport #1", fotoProduk: "Mobil1", hargaProduk: 200000, lokasi: "Kota. Manado", ratingCount: 5, jumlahRating: 80),
        DataModel(id: 2, namaProduk: "Mobil Sport #2", fotoProduk: "Mobil2", hargaProduk: 300000, lokasi: "Kab. Modoinding", ratingCount: 4, jumlahRating: 79),
        DataModel(id: 3, namaProduk: "Mobil Sport #3", fotoProduk: "Mobil3", hargaProduk: 400000, lokasi: "Kab. Modoinding", ratingCount: 4, jumlahRating: 56),
        DataModel(id: 4, namaProduk: "Mobil Sport #4", fotoProduk: "Mobil4", hargaProduk: 500000, lokasi: "Kab. Modoinding", ratingCount: 4, jumlahRating: 68),
        DataModel(id: 5, namaProduk: "Mobil Sport #5", fotoProduk: "Mobil5", hargaProduk: 600000, lokasi: "Kota. Manado", ratingCount: 5, jumlahRating: 90)
    ]
    
    //    @State var jumlahkeranjang:Int = 0
    @ObservedObject var globaldata = GlobalObject()
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(data) { row in // membuat nomor untuk rows
                    VStack(spacing: 20) {
                        Product(data: row, jumlahkeranjang: self.globaldata)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Claudio Mobils")
            .navigationBarItems(
                trailing:
                    HStack(spacing: 20){
                        Button(action: {print("OK")}) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.gray)
                        }
                        NavigationLink(destination: DetailsView(globaldata: globaldata)){
                            KeranjangView(jumlahkeranjang: globaldata)
                        }
                    }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DetailsView : View {
    @ObservedObject var globaldata : GlobalObject
    
    var body: some View {
        NavigationView{
            Text("Details View")
                .navigationBarTitle("Details")
                .navigationBarItems(
                    trailing:
                        HStack(spacing: 20){
                            Button(action: {print("OK")}) {
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color.gray)
                            }
                            
                            KeranjangView(jumlahkeranjang: globaldata)
                            
                        }
                )
        }
    }
}

struct KeranjangView : View {
    //    @Binding var jumlah:Int
    @ObservedObject var jumlahkeranjang : GlobalObject
    
    var body: some View {
        ZStack{
            Image(systemName: "cart.fill")
                .foregroundColor(Color.gray)
            
            
            Text("\(self.jumlahkeranjang.jumlah)")
                .foregroundColor(Color.white)
                .frame(width: 10, height: 10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x: 15, y: -10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product : View {
    
    // property / props seperti di react
    let data: DataModel
    
    //    @Binding var jumlahproduk: Int
    @ObservedObject var jumlahkeranjang : GlobalObject
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .topTrailing){
                Image(self.data.fotoProduk)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Button(action: {print("OK")}) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .foregroundColor(Color.white)
                }
            }
            
            Text(self.data.namaProduk)
                .font(.title)
                .foregroundColor(Color.black)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp \(self.data.hargaProduk)")
                .font(.title)
                .foregroundColor(Color.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, 10)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom, 5)
            
            HStack{
                HStack{
                    ForEach(0..<self.data.ratingCount){
                        items in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            tambahKeranjang(keranjang: jumlahkeranjang)
        }
        .background(Color("Gray2color"))
        .cornerRadius(15)
    }
}

struct tambahKeranjang : View {
    //    @Binding var jumlah: Int
    @ObservedObject var keranjang : GlobalObject
    
    var body: some View {
        Button(action: {self.keranjang.jumlah += 1}) {
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah Ke Keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding()
    }
}
