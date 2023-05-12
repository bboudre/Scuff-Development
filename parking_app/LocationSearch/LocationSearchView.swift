//
//  LocationSearchView.swift
//  parking_app
//
//  Created by Bianka B on 4/22/23.
//
//  UI for the search bar to destination 

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel  // Must create an enviro object 
    
    var body: some View {
        VStack {
            
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
                VStack {
                    TextField("Current location", text: $startLocationText)
                        .frame(height:32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height:32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top,64)
            
            Divider()
                .padding(.vertical)
                
            
            
            ScrollView {
                VStack(alignment: .leading ) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultsCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel
                                        .selectLocation(result)
                                    mapState = .locationSelected
                                    
                                }
                                
                                
                            }
                        
                    }
                    
                }
            }
        }
        .background(.white)
        
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView( mapState: .constant(.searchingForLocation))
    }
}
