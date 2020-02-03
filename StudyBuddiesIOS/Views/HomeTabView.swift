//
//  HomeTabView.swift
//  StudyBuddiesIOS
//
//  Created by Ugyen Dorji on 2/2/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import SwiftUI

struct HomeTabView: View {
    
    //    Dummy data will link to firebase database to pull info such as user's buddies, joined events
    
    let myevents: [Event] = [
            .init(id: 0,eventname: "CS15 HW#2", details: "HW, ELH 100",course: "CS15",location: "ELH 100",date: "2/2/20",time:"12pm", statusImg: "currentevent"),
            .init(id: 3,eventname: "Kevin's Tutoring Time", details: "Creating a dynamic list",course: "Kevin",location: "CSL 1",date: "2/2/20",time:"1pm",statusImg: "currentevent"),
            .init(id: 5,eventname: "Ugyen's Study Session", details: "General studying, starbucks at utc",course: "N/A",location: "Starbucks@UTC",date: "2/3/20",time:"2pm",statusImg: "futureevent"),
            .init(id: 7,eventname: "Taran's Tutoring Time", details: "I'm smart come learn from me.",course: "Taran",location: "My House",date: "2/14/20",time:"9pm",statusImg: "futureevent")
       ]
       
    let mybuddies: [Buddy] = [
           .init(id: 0, uid:"123",name:"Taran",status:"Studying",location:"His house",imagename:"studying"),
           .init(id: 1, uid:"124",name:"Kevin",status:"Studying",location:"CSL 1",imagename:"studying"),
           .init(id: 2, uid:"125",name:"Peter",status:"Not Studying",location:"N/A",imagename:"study")
       ]
    
    var body: some View {
        NavigationView{
                VStack{
                    
                    ScrollView(.horizontal) {
                        Text("My Events").font(.title)
                            .padding(.trailing, 440.0)
                        HStack(spacing: 20) {
                                       ForEach(myevents) {myevent in
                                            NavigationLink(destination: EventDetail()) {
                                                EventColumn(myevent: myevent)
                                            }.buttonStyle(PlainButtonStyle())
                                              
                                       }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Buddies")
                        .font(.title)
                        .padding(.leading, -190.0)
                    
                    List(mybuddies){ buddy in
                           BuddyRow(buddy: buddy)
                       }.navigationBarTitle(Text("Study Events")
                           .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                           )
                }
                
               
                
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
