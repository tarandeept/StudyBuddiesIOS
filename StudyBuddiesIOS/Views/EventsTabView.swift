//
//  EventsTabView.swift
//  StudyBuddiesIOS
//
//  Created by Ugyen Dorji on 2/2/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import SwiftUI
import Firebase





struct EventsTabView: View {
    
     @State private var theTitle = ""
     @State private var theClass = ""
     @State private var theTime = ""
     @State private var theLocation = ""
    
    let theEvents: [Event] = renderEvents()!
    
    let myevents: [Event] = [
            .init(id: 0,eventname: "CS15 HW#2", details: "HW, ELH 100",course: "CS15",location: "ELH 100",date: "2/2/20",time:"12pm", statusImg: "currentevent"),
            .init(id: 3,eventname: "Kevin's Tutoring Time", details: "Creating a dynamic list",course: "Kevin",location: "CSL 1",date: "2/2/20",time:"1pm",statusImg: "currentevent"),
            .init(id: 5,eventname: "General Study Session", details: "General studying, starbucks at utc",course: "N/A",location: "Starbucks@UTC",date: "2/3/20",time:"2pm",statusImg: "futureevent"),
            .init(id: 7,eventname: "Taran's Tutoring Time", details: "I'm smart come learn from me.",course: "Taran",location: "My House",date: "2/14/20",time:"9pm",statusImg: "futureevent")
       ]
    
    
    var body: some View {
        VStack(spacing: 20.0){
            Button(action:{print(self.theEvents)}){
                Text("Click Me!")
            }
            List(myevents){event in
                EventRow(event: event)
            }.navigationBarTitle(Text("Events")
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            )
            Text("Event")
                .fontWeight(.bold)
            TextField(" Title", text: $theTitle)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
            TextField(" Class", text: $theClass)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            TextField(" Location", text: $theLocation)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            TextField(" Time", text: $theTime)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Button(action: {createTapped(Title: self.theTitle, Class: self.theClass, Location: self.theLocation, Time: self.theTime)}) {
            Text("Create")
                .font(.body)
                .foregroundColor(Color.blue)
                .background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                

           }
         }
        .padding(.all, 52.0)
    }
}


func renderEvents() -> [Event]? {
    
    print("Attempting to render events list...")
    let db = Firestore.firestore()
    
    
    var theEvents:[Event] = []
    
    
    db.collection("events").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                
                let Title = document.data()["title"]!
                let Class = document.data()["class"]!
                let Location = document.data()["location"]!
                let Time = document.data()["time"]!
                let Details = ""
                let Date = ""
                
                let theEvent = Event.init(id: 0, eventname: Title as! String, details: Details, course: Class as! String, location: Location as! String, date: Date, time: Time as! String, statusImg: "studying")
                
                theEvents.append(theEvent)
            }
        }
    }

    print("Returning this list")
    print(theEvents)

    print("FINISHED")
    return theEvents
    
    
}




func createTapped(Title: String, Class: String, Location: String, Time: String) {
//    Validate the fields
//    let error = validateFields(Title: Title, Class: Class, Location: String, Time: String)
//
//
//    if error != nil {
//        showError(error!)
//    }
//    else {
        //Create cleaned versions of the fields

        //Add the event to the Firebase DB
    
        print(Title)
        
        let db = Firestore.firestore()
        
        

        db.collection("events").addDocument(data: ["class": Class,
                                                  "location": Location,
                                                  "time": Time,
                                                  "title": Title,
                                                  "participants": 1])

//        self.transitionToHome()
//    }
}

    

struct EventsTabView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTabView()
    }
}
