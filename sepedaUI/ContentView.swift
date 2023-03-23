//
//  ContentView.swift
//  sepedaUI
//
//  Created by muhammad rival on 22/03/23.
//

import SwiftUI

//model
struct ProductModel : Identifiable{
    let id: Int
    let photoProduk: String
    let namaProduk: String
    let hargaProduk: Int
    let lokasiProduk: String
    let ratingCount: Int
    let jumlahRating: Int
    
    init(id: Int, photoProduk: String, namaProduk: String, hargaProduk: Int, lokasiProduk: String, ratingCount: Int, jumlahRating: Int) {
        self.id = id
        self.photoProduk = photoProduk
        self.namaProduk = namaProduk
        self.hargaProduk = hargaProduk
        self.lokasiProduk = lokasiProduk
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
    
}

struct ContentView: View {
    
    //data baru
    let data : [ProductModel] = [
        ProductModel(id: 1, photoProduk: "foto1", namaProduk: "Sepeda Poly gon", hargaProduk: 1500000, lokasiProduk: "Jawa Tengah", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 2, photoProduk: "foto2", namaProduk: "Sepeda Polygon 2", hargaProduk: 2500000, lokasiProduk: "Jawa Tengah", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 3, photoProduk: "foto3", namaProduk: "Sepeda Polygon 3", hargaProduk: 4500000, lokasiProduk: "Jawa Tengah", ratingCount: 2, jumlahRating: 56),
        ProductModel(id: 4, photoProduk: "foto4", namaProduk: "Sepeda Polygon 4", hargaProduk: 500000, lokasiProduk: "Jawa Tengah", ratingCount: 1, jumlahRating: 56),
        ProductModel(id: 5, photoProduk: "foto5", namaProduk: "Sepeda Polygon 5", hargaProduk: 10500000, lokasiProduk: "Jawa Tengah", ratingCount: 5, jumlahRating: 56)
    ]
    
    @State var jumlahKeranjang:Int = 0
    var body: some View {
        //ProductCard(data: <#ProductModel#>)
        
        NavigationView{
            ScrollView{
                ForEach(data){
                    row in
                    VStack(spacing: 10){
                        ProductCard(data: row, jumlah: self.$jumlahKeranjang)
                    }
                    .padding()
                }
            }
            .navigationBarItems(
                leading:
                    HStack{
                        Button(action: {jumlahKeranjang -= 1}){
                            Image(systemName: "minus.square")
                        }
                        
                    }.accentColor(Color.secondary)
                ,
                trailing:
                    HStack{
                        NavigationLink(destination: Profile()){
                            
                            Image(systemName: "person.fill")
                            
                        }
                        
                        keranjang(jumlah: $jumlahKeranjang)
                        
                        
                    }
                    .accentColor(Color.secondary)
                
            )
            
            .navigationBarTitle("Toko Sepeda")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct keranjang: View {
    @Binding var jumlah :Int
    
    var body: some View{
        ZStack{
            Button(action: {print("ok")}){
                Image(systemName: "cart.fill")
            }
            Text("\(jumlah)")
                .foregroundColor(Color.white)
                .font(.body)
                .frame(width: 35, height: 10)
                .padding(5)
                .background(Color.orange)
                .clipShape(Circle())
                .offset(x: 10, y: -15)
                .bold()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProductCard: View{
    //ngambil data
    let data : ProductModel
    @Binding var jumlah:Int
    var body: some View{
        VStack(alignment: .leading){
            //foto
            ZStack(alignment: .topTrailing){
                Image(self.data.photoProduk)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Button(action: {print("oke")}) {
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(Color.red)
                }
                
            }
            
            //title
            Text(self.data.namaProduk)
                .font(.title).bold()
                .padding(.leading)
                .padding(.trailing)
            
            //harga
            Text("Rp.\(self.data.hargaProduk)")
                .font(.title).bold()
                .foregroundColor(Color.red)
                .padding(.leading)
                .padding(.trailing)
            
            //lokasi
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasiProduk)
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top,2)
            
            
            //ratting
            HStack{
                HStack{
                    
                    ForEach(0..<data.ratingCount, id: \.self){
                        items in Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                    
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top,1)
            
            buttonKeranjang(tombolKeranjang: $jumlah)
           
            
        }
        .background(Color("warna"))
        .cornerRadius(15)
    }
}

struct buttonKeranjang: View{
    @Binding var tombolKeranjang : Int
    var body: some View{
        //tombol tambah ke keranjang
        Button(action: {self.tombolKeranjang += 1 }){
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah ke keranjang")
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

