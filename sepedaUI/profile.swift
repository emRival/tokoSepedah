//
//  profile.swift
//  sepedaUI
//
//  Created by muhammad rival on 22/03/23.
//

import Foundation
import SwiftUI

struct Profile: View{
    var body: some View{
            Form{
                //section poto profile
                Section(){
                    HStack{
                        NavigationLink(destination: About()) {
                            Image("profile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            // nama dan status
                            VStack(alignment:.leading){
                                Text("Muhammad Rival").font(.headline)
                                Text("Code Enthusiast").font(.caption)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    }
                }
                
                //section pengaturan umum
                Section(header: Text("Pengaturan akun")){
                    HStack(spacing: 30){
                        NavigationLink(destination: About()) {
                            Image(systemName: "house.fill")
                                .frame(width: 35, height: 35)
                                .background(Color.orange)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            
                            Text("Daftar Alamat").font(.headline)
                        }
                    }
                    
                    HStack(spacing: 30){
                        NavigationLink(destination: About()) {
                            Image(systemName: "creditcard.fill")
                                .frame(width: 35, height: 35)
                                .background(Color.green)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            
                            Text("Rekening Bank").font(.headline)
                        }
                    }
                    
                    HStack(spacing: 30){
                        NavigationLink(destination: About()) {
                            Image(systemName: "key.radiowaves.forward.fill")
                                .frame(width: 35, height: 35)
                                .background(Color.red)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            
                            Text("Keamanan Akun").font(.headline)
                        }
                    }
                    
                }
                .padding(.top, 3)
                .padding(.bottom, 3)
                
                //section pengaturan akun
                Section{
                    HStack(spacing: 30){
                        NavigationLink(destination: About()) {
                            Image(systemName: "door.left.hand.open")
                                .frame(width: 35, height: 35)
                                .background(Color.black)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            
                            Text("Keluar").font(.headline)
                        }
                    }
                    
                    
                }
                .padding(.top, 3)
                .padding(.bottom, 3)
            }
            .navigationBarTitle("Profile")
            
        }
}

struct About: View{
    var body: some View{
        Text("hello about")
    }
}

