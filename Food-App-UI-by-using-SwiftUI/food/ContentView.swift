//
//  ContentView.swift
//  food
//
//  Created by Abu Anwar MD Abdullah on 25/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 16) {
                HomeNavBarView()
                
                Text("Bonjour, Emma")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color("GrayColor"))
                
                Text("What sould you like to cook today?")
                    .font(.title)
                    .fontWeight(.bold)
                
                SearchAndFilterView(search: $search)
                
                SectionTabTitleView(title: "Today's Fresh Recipes")
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 16) {
                        BigRecipeCardView(image: #imageLiteral(resourceName: "fresh_recipe_1"))
                        BigRecipeCardView(image: #imageLiteral(resourceName: "fresh_recipe_2"))
                    }
                }
                
                SectionTabTitleView(title: "Recommended")
                
                SmallRecipeCardView(image: #imageLiteral(resourceName: "reco_3"), title: "Asian Glazed Chicken Thighs")
                SmallRecipeCardView(image: #imageLiteral(resourceName: "reco_1"), title: "Blueberry Muffins")
                SmallRecipeCardView(image: #imageLiteral(resourceName: "reco_2"), title: "French Toast with Berries")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






struct HomeNavBarView: View {
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName: "menu"))
                .onTapGesture {
                    
                }
            
            Spacer()
            
            Image(uiImage: #imageLiteral(resourceName: "notifications"))
                .onTapGesture {
                    
                }
        }
    }
}

struct SearchAndFilterView: View {
    @Binding var search: String
    var body: some View {
        HStack (spacing: 16) {
            HStack {
                Image(uiImage: #imageLiteral(resourceName: "search"))
                TextField("Search For Recipes", text: $search)
            }
            .padding()
            .background(Color("LightGrayColor"))
            .cornerRadius(8.0)
            
            Image(uiImage: #imageLiteral(resourceName: "filter"))
                .padding()
                .background(Color("LightGrayColor"))
                .cornerRadius(8.0)
                .onTapGesture {
                    
                }
        }
    }
}

struct SectionTabTitleView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
            
            Text("See All")
                .foregroundColor(Color("PrimaryColor"))
                .onTapGesture {
                    
                }
        }
    }
}

struct BigRecipeCardView: View {
    let image: UIImage
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 8) {
                Image(uiImage: #imageLiteral(resourceName: "like"))
                    .padding(.bottom, 60)
                
                Text("Breakfast")
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                
                Text("French Toast with Barries")
                    .fontWeight(.medium)
                
                HStack (spacing: 2) {
                    ForEach(0 ..< 5) { item in
                        Image(uiImage: #imageLiteral(resourceName: "star"))
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
                Text("120 Calories")
                    .font(.caption)
                    .foregroundColor(Color("PrimaryColor"))
                
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "time"))
                    Text("10 min")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image(uiImage: #imageLiteral(resourceName: "serving"))
                    Text("1 Serving")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                }
            }
            .frame(width: 147)
            .padding()
            .background(Color("LightGrayColor"))
            .cornerRadius(20.0)
            
            // Image
            Image(uiImage: image)
                .offset(x: 45, y: -60)
        }
        .padding(.trailing, 25)
    }
}

struct SmallRecipeCardView: View {
    
    let image: UIImage
    let title: String
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            
            VStack (alignment: .leading, spacing: 4) {
                Text("Breakfast")
                    .font(.caption)
                    .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                
                Text(title)
                    .fontWeight(.medium)
                
                HStack (spacing: 2) {
                    ForEach(0 ..< 5) { item in
                        Image(uiImage: #imageLiteral(resourceName: "star"))
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    Text("120 Calories")
                        .font(.caption)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.leading)
                }
                
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "time"))
                    Text("10 min")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image(uiImage: #imageLiteral(resourceName: "serving"))
                    Text("1 Serving")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    Spacer()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("LightGrayColor"))
        .cornerRadius(18.0)
    }
}
