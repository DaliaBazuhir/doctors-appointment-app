//
//  AppointmentDetailsView.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 04/04/1446 AH.
//

import SwiftUI

struct AppointmentDetailsView: View {
    var doctor: Doctor;
    var day: String
    var time : String
    @ObservedObject var user_view_model: UserViewModel
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Appointment success").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            HStack{
                Image(doctor.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black)
                    ).padding()
                VStack{
                    Text("Dr. \(doctor.name)")
                        .foregroundColor(Color.black)
                        .font(.title2)
                    Text(doctor.speciality)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack{
                    Text(day)
                        .foregroundColor(Color.black)
                        .font(.title2)
                    Text(time)
                        .font(.title2)
                }.padding()
            }
            Divider()
            VStack(alignment:.leading){
                Text("Summary")
                    .font(.title2)
                    .bold()
                    .padding([.bottom,.top],20)
                Text("Appointment’s Date")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text("\(day)").padding(.bottom,10)
                Text("Appointment’s Doctor")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text(doctor.name).padding(.bottom,10)
            }
            Button(action: {
                
               
            }, label: {
                Text("Share")
                    .foregroundColor(.black)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("baby_blueColor"))
                            .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                    ).overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.black,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                    )
            }).padding()
            
            Button(action: {
                dismiss()
                user_view_model.add_appointemntTo_user(doctorName: doctor.name, day: day, time: time)
            }, label: {
                Text("Done")
                    .foregroundColor(.black)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("light_greenColor"))
                            .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                    ).overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.black,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                    )
            }).padding()
            
        }.background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("color2"))
                .frame(height: UIScreen.main.bounds.height*2/3)
                .overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(Color.primary,lineWidth: 1)
                )
            
        ).padding()
    }
}


//#Preview {
//    AppointmentDetailsView()
//}

/**
 struct Appointment_Details_View: View {
     var doctor: Docotor;
     var selectedAppointment: Appointement;
     @Binding  var dismiss: Bool;
     var body: some View {
         VStack{
             Text("Appointment success").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
             HStack{
                 Image(doctor.image)
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 75, height: 80)
                     .clipShape(Circle())
                     .overlay(Circle().stroke(Color.black)
                     ).padding()
                 VStack{
                     Text("Dr. \(doctor.image)")
                         .foregroundColor(Color.black)
                         .font(.title2)
                     Text(doctor.speciality)
                         .font(.subheadline)
                         .foregroundColor(.gray)
                 }
                 Spacer()
                 VStack{
                     Text(selectedAppointment.appintment_day)
                         .foregroundColor(Color.black)
                         .font(.title2)
                     Text(selectedAppointment.appintment_time)
                         .font(.title2)
                 }.padding()
             }
             Divider()
             VStack(alignment:.leading){
                 Text("Summary")
                     .font(.title2)
                     .bold()
                     .padding([.bottom,.top],20)
                 Text("Appointment’s Date")
                     .font(.headline)
                     .foregroundColor(.gray)
                 Text("\(selectedAppointment.appintment_day)").padding(.bottom,10)
                 Text("Appointment’s Doctor")
                     .font(.headline)
                     .foregroundColor(.gray)
                 Text(doctor.name).padding(.bottom,10)
             }
             Button(action: {
                 dismiss = false;
             }, label: {
                 Text("Share")
                     .foregroundColor(.black)
                     .bold()
                     .background(
                     RoundedRectangle(cornerRadius: 12)
                         .fill(Color("baby_blueColor"))
                         .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                     ).overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color.black,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                             .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                     )
             }).padding()
            
             Button(action: {
                 dismiss = false;
             }, label: {
                 Text("Done")
                     .foregroundColor(.black)
                     .bold()
                     .background(
                     RoundedRectangle(cornerRadius: 12)
                         .fill(Color("light_greenColor"))
                         .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                     ).overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color.black,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                             .frame(width: UIScreen.main.bounds.width*2/3,height: 50)
                     )
             }).padding()
            
         }.background(
             RoundedRectangle(cornerRadius: 12)
                 .fill(Color("light_greenColor"))
                 .frame(height: UIScreen.main.bounds.height*2/3)
                 .overlay(
                     RoundedRectangle(cornerRadius: 12).stroke(Color.primary,lineWidth: 1)
                 )
            
         ).padding()
     }
 }

*/
