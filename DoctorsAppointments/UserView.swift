//
//  UserView.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 03/04/1446 AH.
//

import SwiftUI

class UserAppointment: Identifiable{
    let id =    UUID()
    var doctorName : String
    var appointmentDay : String
    var appointmentTime : String
    init(doctorName: String, appointmentDay: String, appointmentTime: String) {
        self.doctorName = doctorName
        self.appointmentDay = appointmentDay
        self.appointmentTime = appointmentTime
    }
}

class UserViewModel: ObservableObject{
    @Published var user_appointments: [UserAppointment] = []
    @Published var user_favourites: [Hospital] = []
    func add_appointemntTo_user(doctorName: String, day: String, time: String){
        var newapp = UserAppointment(doctorName: doctorName, appointmentDay: day, appointmentTime: time)
        user_appointments.append(newapp)
    }
    
}
struct UserView: View {
    @ObservedObject var hospital_view_model : HospitalViewModel

    @ObservedObject var user_appointments_model = UserViewModel()
    var body: some View {
        VStack{
            List {
                Section(header: Text("User Appointments")) {
                    ForEach(user_appointments_model.user_appointments){ app in
                        VStack(alignment:.leading){
                           Text(app.doctorName)
                               .font(.title2)
                           HStack{
                               Text("\(app.appointmentDay)").foregroundColor(.black.opacity(0.8)).padding(.trailing,60)
                               Text(app.appointmentTime).foregroundColor(.black.opacity(0.8))
                           }.font(.title3)
                        }
                    }
                }
                Section(header: Text("User Favourite Hspitals")) {
                    ForEach(hospital_view_model.favourites){ fav in
                       
                           HStack{
                               Image(fav.hospital_Image)
                                   .resizable()
                                   .aspectRatio(contentMode: .fill)
                                   .frame(width: 80,height: 80)
                                   .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                   .overlay(Circle().stroke(Color.black))
                               VStack(alignment:.leading){
                                   Text(fav.hospital_name)
                                      .font(.title2)
                               Text(fav.hospital_field).foregroundColor(.gray).padding(.trailing,60)
                              
                           }.font(.title3)
                        }
                    }
                }

            }
        }
        
    }
}

//#Preview {
//    UserView()
//}
