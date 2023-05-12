//
//  NavView.swift
//  parking_app
//
//  Created by Bianka B on 4/22/23.
//
// UI for the mapView

import SwiftUI

struct NavView: View {
    @State private var mapState = MapViewState.noInput // helps with presentation state
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapView(mapState: $mapState)
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation{
                    LocationSearchView( mapState: $mapState)
                }
                else if mapState == .noInput{
                    LocationSearchActiveView()
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring ()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
        
                MapViewActionButton(mapState: $mapState)
                    .padding(.trailing)
                    .padding(.top,4)
                
            }
            
            if mapState == .locationSelected {
                ParkingCounter()
                    .transition(.move(edge: .bottom))
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
