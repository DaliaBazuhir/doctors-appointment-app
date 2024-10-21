//
//  HospitalScreen.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 03/04/1446 AH.
//

import SwiftUI

struct HospitalScreen: View {
    @ObservedObject var hospitalView : HospitalViewModel
    @State var searchedDoctor = ""
    var body: some View {
            
            VStack{
                ScrollView(.vertical,showsIndicators: false){
                ZStack{
                    Rectangle()
                        .fill(Color("color2").opacity(0.5))
                        .frame(width: .infinity,height:120)
                    HStack {
                        TextField("Search Doctors", text: $searchedDoctor)
                            .padding()
                            .background(Color.gray.opacity(0.2).cornerRadius(10)
                                .frame(height: 40))
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                        .padding([.top,.bottom])
                }.padding(.bottom,50)
               
                    ForEach(hospitalView.hospitals){ hospital in
                        NavigationLink {
                            EachHospitalView(hospital: hospital, hospitalView: hospitalView)
                        } label: {
                            HospitalCard(hospital: hospital).padding(.bottom,80)
                        }
                        
                    }
                }
                .navigationTitle("Hospitals")
            }
        
    }
}

