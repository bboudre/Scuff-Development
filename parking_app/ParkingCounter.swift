//
//  ParkingCounter.swift
//  parking_app
//
//  Created by Bianka B on 5/11/23.
//

import SwiftUI

struct ParkingCounter: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width:48, height:6)
                .padding(.top, 8)
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width:6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width:1, height: 24)
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width:6, height: 6)
                }
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current location")
                            .font(.system(size:16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("12:00 pm")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom,10)
                    
                    HStack {
                        Text("Destination")
                            .font(.system(size:16, weight: .semibold))
                        
                        Spacer()
                        
                        Text("12:05 pm")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 0)
            }
            .padding()
            
            Divider()
        
            
            Text("AVAILABLE PARKING")
                .font( .subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Org: Permit Type, Availability, Distance")
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(0 ..< 3, id: \.self) { _ in
                        VStack(alignment: .leading) {
                            
                            VStack {
                                Text("Lot 45")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text("Available: 1")
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }
                            .padding(8)
                            
                        }
                        .frame(width:112, height:140)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            Divider()
                .padding(.vertical, 8)
            
            Button {
                
            } label: {
                Text("CONFIRM LOT")
                    .fontWeight(.bold)
                    .frame( width:UIScreen.main.bounds.width - 32, height:50)
                    .background(Color("Crimson"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(16)
    }
}

struct ParkingCounter_Previews: PreviewProvider {
    static var previews: some View {
        ParkingCounter()
    }
}
