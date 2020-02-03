//
//  HomeView.swift
//  DynamicList
//
//  Created by Ugyen Dorji on 2/1/20.
//  Copyright © 2020 Ugyen Dorji. All rights reserved.
//

import MapKit
import SwiftUI

struct Event: Identifiable{
    var id: Int
    
    var eventname, details, course, location,date,time,statusImg: String
}

struct Buddy: Identifiable{
    var id: Int
    
    let uid,name, status,location,imagename: String
}

struct HomeView: View {
    @State private var selection = 0
    
    
    var body: some View {
        TabView(selection: $selection) {
            
//            Home View
            HomeTabView()
                .tabItem { VStack(alignment: .center) {
                    Image("homes")
                    Text("Home")
            } }.tag(1)
            
//          Search/Explore View
            
            ExploreTabView()
                .tabItem { VStack(alignment: .center) {
                    Image("globe")
                    Text("Explore")
            }  }.tag(2)
            
//            Add Event
            EventsTabView().tabItem { VStack(alignment: .center) {
            Image("globe")
            Text("Create")
            }  }.tag(3)
        }
      
    }
}

struct BuddyRow: View{
    let buddy: Buddy
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .center){
                    Image(buddy.imagename)
                    .resizable()
                    .frame(width:30, height: 30)
                    .clipped()
                    Text(buddy.name).font(.headline)
                }
                
                VStack(alignment: .leading){
                    
                    Text("Status: " + buddy.status).font(.headline)
                    Text("Where: " + buddy.location).font(.headline)
                }
                .padding(.leading)
            }
        }
    }
}

struct EventColumn: View{
    let myevent: Event
    
    var body: some View{
        HStack{
            Image(myevent.statusImg)
                .resizable()
                .frame(width:50,height: 50)
                .clipped()
            VStack(alignment: .leading){
                Text(myevent.course).font(.headline)
                Text(myevent.location).font(.subheadline)
                Text(myevent.date).font(.subheadline)
                Text(myevent.time).font(.subheadline)
            }
            
        }
    }
    
}

struct EventRow: View {
    let event: Event
    
    
    var body: some View {
        HStack{
            Text(event.eventname).font(.headline)
            VStack(alignment: .leading){
                Text(event.details).font(.subheadline)
                HStack{
                    Text("Location: " + event.location)
                    Text("Time: " + event.time)
                }
                
            }
        }
    }
    
}



struct EventDetail: View {
//    let events: [Event] = [
//        .init(id: 0, eventname: "CS132 Midterm Review", details: "CS 132 Review Sesh, at PSLH 100", course: "CS 132",location: "PSLH 100", date: "2/1/20",time:"12pm", statusImg: "futureevent"),
//        .init(id: 1,eventname: "CS15 HW#2", details: "HW, ELH 100",course: "CS15",location: "ELH 100",date: "2/2/20",time:"12pm", statusImg: "currentevent"),
//        .init(id: 2,eventname: "Peter's Study Time", details: "Creating a dynamic list",course: "Peter",location: "CSL 9",date: "2/2/20",time:"12pm",statusImg: "currentevent"),
//        .init(id: 3,eventname: "Kevin's Tutoring Time", details: "Creating a dynamic list",course: "Kevin",location: "CSL 1",date: "2/2/20",time:"1pm",statusImg: "currentevent"),
//        .init(id: 4, eventname: "CS101 Final Review", details: "CS 101 Review Sesh, at PSLH 100", course: "CS 101",location: "EH 100",date: "2/2/20",time:"4pm",statusImg: "currentevent"),
//        .init(id: 5,eventname: "General Study Session", details: "General studying, starbucks at utc",course: "N/A",location: "Starbucks@UTC",date: "2/3/20",time:"2pm",statusImg: "futureevent"),
//        .init(id: 6,eventname: "Ugyen's Study Time", details: "Studying from 12-2",course: "Peter",location: "CSL 3",date: "2/12/20",time:"12pm",statusImg: "futureevent"),
//        .init(id: 7,eventname: "Taran's Tutoring Time", details: "I'm smart come learn from me.",course: "Taran",location: "My House",date: "2/14/20",time:"9pm",statusImg: "futureevent")
//    ]
    
    var body: some View {
        VStack{
            Text("Hey")
        }
        
//        VStack {
////            MapView(coordinate: event.locationCoordinate)
////                .edgesIgnoringSafeArea(.top)
////                .frame(height: 300)
//
//            CircleImage(image: statusImg)
//                .offset(x: 0, y: -130)
//                .padding(.bottom, -130)
//
//            VStack(alignment: .leading) {
//                Text(event.eventname)
//                    .font(.title)
//
//                HStack(alignment: .top) {
//                    Text(event.date)
//                        .font(.subheadline)
//                    Spacer()
//                    Text(event.time)
//                        .font(.subheadline)
//                }
//            }
//            .padding()
//
//            Spacer()
//        }
//        .navigationBarTitle(Text(event.eventname), displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
