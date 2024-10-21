//
//  ReviewCard.swift
//  DoctorsAppointments
//
//  Created by Dalya Bazuhair on 02/04/1446 AH.
//

import SwiftUI

struct ReviewCard: View {
    @State var review : Review
    var body: some View {
        
            VStack{
                HStack{
                    Image(review.userImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60,height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    Text(review.userName)
                        .font(.headline)
                        .foregroundColor(.primary)
                       Spacer()
                    HStack{
                        Image(systemName:"star.fill").font(.caption2)
                        Image(systemName:"star.fill").font(.caption2)
                        Image(systemName:"star.fill").font(.caption2)
                        Image(systemName:"star.fill").font(.caption2)
                        Image(systemName:"star.fill").font(.caption2)
                    }.padding()
                }
                Text(review.review).lineLimit(4)
                        .padding(.bottom,10)
            
            }.background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color("color2").opacity(0.2))
                    .stroke(Color.black,lineWidth: 1)
                    .frame(width:370,height:150)
            ).padding()
        
        
   
        
    }
}
