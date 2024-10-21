import SwiftUI

struct DoctorDetailsView: View {
    @ObservedObject var selectedDoctor: Doctor
    @State private var selectedDay: String? = nil // State to store the selected day
    @State  var day: String = ""
    @State  var time: String = ""
    @ObservedObject var user_view_model: UserViewModel

    var filteredAppointments: [Appointment] {
        // Filter appointments based on the selected day
        guard let day = selectedDay else { return [] }
        return selectedDoctor.appointments.filter { $0.appintment_day == day }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                doctorInfoSection
                
                // Working Days Section
                sectionTitle("Working Day")
                
                daySelectionGrid
                
                // Working Hours Section
                if let selectedDay = selectedDay {
                    sectionTitle("Working Hours for \(selectedDay)")
                    workingHoursGrid
                }
                
                // Book Now Section
                bookNowSection
            }
            .padding()
        }
    }
    
    // MARK: - Subviews
    
    var doctorInfoSection: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("color1"))
                .frame(height: UIScreen.main.bounds.height / 3)
            
            VStack {
                HStack {
                    Image(selectedDoctor.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 3, height: 100)
                    doctorDetailsInfo
                }
                .padding()
                
                doctorStatsSection
                    .padding([.top, .bottom])
            }
        }
    }
    
    var doctorDetailsInfo: some View {
        VStack(alignment: .leading) {
            Text(selectedDoctor.name)
            Text(selectedDoctor.speciality)
                .foregroundColor(.gray)
            
            HStack {
                contactButtons
            }
            .padding([.top, .bottom])
            
            HStack {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Text("\(selectedDoctor.totalRatings)")
            }
            .font(.caption2)
        }
    }
    
    var contactButtons: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "phone.fill")
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 30, height: 30)
                    )
            })
            .padding([.leading, .trailing])
            
            Button(action: {}, label: {
                Image(systemName: "message.fill")
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 30, height: 30)
                    )
            })
        }
    }
    
    var doctorStatsSection: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                .frame(width: 350, height: 50)
            
            HStack {
                statColumn(title: "Reviews", value: "2")
                statSeparator
                statColumn(title: "Years Exp", value: "\(selectedDoctor.Exp_year)+")
                statSeparator
                statColumn(title: "Patients", value: "200")
            }
        }
    }
    
    var statSeparator: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.5))
            .frame(width: 1, height: 30)
    }
    
    func statColumn(title: String, value: String) -> some View {
        VStack {
            Text(title)
            Text(value)
        }
    }
    
    var daySelectionGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
            ForEach(selectedDoctor.appointments.map(\.appintment_day).unique(), id: \.self) { day in
                Text(day)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(selectedDay == day ? Color.blue.opacity(0.3) : Color.gray.opacity(0.1))
                            .frame(width: 110, height: 60)
                    )
                    .onTapGesture {
                        selectedDay = day
                    }
            }
        }.padding(.top,30)
    }
    var workingHoursGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
            ForEach(filteredAppointments.indices, id: \.self) { index in
                let appointment = filteredAppointments[index]
                
                Text(appointment.appintment_time)
                    .frame(width: 110, height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(appointment.appintment_availability ? Color.green.opacity(0.3) : Color.red.opacity(0.3))
                    )
                    .onTapGesture {
                        // Update the availability when tapped
                        if(filteredAppointments[index].appintment_availability){
                            filteredAppointments[index].appintment_availability.toggle()
                            day = filteredAppointments[index].appintment_day
                            time = filteredAppointments[index].appintment_time
                        }
                        
                    }
            }
        }.padding(.top, 30)
    }

    var bookNowSection: some View {
        HStack {
            Text("\(selectedDoctor.sessionPrice,specifier: "%2.f")$")
                .font(.title2)
                .bold()
            
//            Button(action: {}, label: {
            NavigationLink {
//                AppointmentDetailsView(doctor: selectedDoctor,day: day,time: time)
                AppointmentDetailsView(doctor: selectedDoctor, day: day, time: time, user_view_model: user_view_model)
            } label: {
                Text("Book Now")
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("color2"))
                            .frame(width: UIScreen.main.bounds.width - 150, height: 40)
                    )
                    .padding(.leading, 140)
                    
            }

                        
//            })
        }
        .padding([.trailing], 50)
        .padding([.top], 50)
    }
    
    // Helper to create section titles
    func sectionTitle(_ title: String) -> some View {
        Text(title)
            .padding([.top, .trailing], 20)
            .font(.title2)
            .bold()
    }
}

// Helper extension to get unique days
extension Array where Element: Hashable {
    func unique() -> [Element] {
        var seen: Set<Element> = []
        return filter { seen.insert($0).inserted }
    }
}
