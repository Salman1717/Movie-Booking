//
//  SeatsView.swift
//  MovieBooking
//
//  Created by Salman Mhaskar on 27/06/23.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var animate = false
    @State  var showButton = false
    
    var body: some View {
        VStack(spacing: 0.0){
            HStack{
                CircleButton(action: {
                    dismiss()
                }, image: "arrow.left")
                
                Spacer()
                
                Text("Choose Seats")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                CircleButton(action: {}, image: "calendar")
                
            }
            .padding(.top, 46)
            .padding(.horizontal, 20)
            
            Image("frontSeat")
                .padding(.top, 55)
                .glow(color: Color("pink"), radius: 20)
            
            Image("seats")
                .frame(height: 240)
                .padding(.top, 60)
                .padding(.horizontal, 20)
                .onTapGesture {
                    withAnimation(.spring()){
                        showButton = true
                    }
                }
            
            HStack(spacing: 20.0){
                StatusUI()
                
                StatusUI(color: Color("majenta"), text: "Reserved")
                
                StatusUI(color: Color("cyan"), text: "Selected")
            }
            .padding(.top, 60)
            
            ZStack(alignment: .topLeading){
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("purple"))
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? -100 : 20, y:animate ? -20 : 20)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()){
                            animate.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("lightBlue"))
                    .blur(radius: animate ? 50 : 100)
                    .offset(x: animate ? 150 : 170, y:animate ? 90 : 100)
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("pink"))
                    .blur(radius: animate ? 70 : 100)
                    .offset(x: animate ? -100 : 20, y:animate ? -20 : 20)
                
                VStack(alignment: .leading, spacing: 30.0){
                    HStack(spacing: 10.0){
                        Image(systemName: "calendar")
                        
                        Text("April 28, 2023")
                        
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Text("5 p.m.")
                    }
                    
                    HStack(spacing: 10.0){
                        Image(systemName: "ticket.fill")
                        
                        Text("VIP Section")
                        
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Text("Seat 9, 10")
                    }
                    
                    HStack(spacing: 20.0){
                        Image(systemName: "cart")
                        
                        Text("Total: 1299₹")
                    }
                    
                }
                .padding(42)
                .font(.subheadline)
                
                HStack {
                    Spacer()
                    RoundButton(action: {
                        NavigationUtil.popToRootView()
                    })
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            .padding(.top, 50)
            .offset(y: showButton ? 0 : 250)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView()
    }
}
