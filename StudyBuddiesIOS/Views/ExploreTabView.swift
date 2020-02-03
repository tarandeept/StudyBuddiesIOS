//
//  ExploreTabView.swift
//  StudyBuddiesIOS
//
//  Created by Ugyen Dorji on 2/2/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import SwiftUI

struct ExploreTabView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                MapView()
            }
        }.tabItem { VStack(alignment: .center) {
        Image("globe")
        Text("Explore")
        }  }
    }
}

struct ExploreTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreTabView()
    }
}
