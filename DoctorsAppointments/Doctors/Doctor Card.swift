//
//  Doctor Card.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 30/03/1446 AH.
//

import SwiftUI


struct DoctorCard: View {
    var doctor : Doctor;
    var body: some View {
       ZStack {
            RoundedRectangle(cornerRadius: 15)
               .fill(doctor.gender == "male" ? Color("color1"):  Color("color3"))
                .frame(width: UIScreen.main.bounds.width/2 - 20,height:  UIScreen.main.bounds.height/3 - 20)
            VStack{
                Image(doctor.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width/2 - 80,height:  UIScreen.main.bounds.height/3 - 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack(alignment:.leading){
                    Text(doctor.name)
                        .foregroundColor(.black)
                        .padding(.top)
                    Text(doctor.speciality)
                        .foregroundColor(.gray)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(doctor.totalRatings, specifier: "%.1f")")
                            .foregroundColor(.black)
                        
                    }.font(.caption2)
                }
            }
        }
    }
}

