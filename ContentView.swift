//
//  ContentView.swift
//  Custom Navigation Bar
//
//  Created by Priya Hansaliya on 30/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var isSideMenuOpen: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                CustomNavigationBar(isBack: true, title: "NAVIGATION", isSideMenuOpen: $isSideMenuOpen)
                
                ScrollView(.vertical, showsIndicators: true){
                    VStack(alignment: .leading) {
                        
                        Text("Radio Channels")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding(.bottom, -2)
                            .padding(.top, 5)
                        ForEach(0..<10, id: \.self) { index in
                            ListView(for: index).background(.gray).cornerRadius(radius: 12, corners: .allCorners)
                        }
                    } .padding([.leading,.trailing], 16)
                }
            }
        }
    }
    
    @ViewBuilder
    private func ListView(for index: Int) -> some View {
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    ZStack(alignment: .topTrailing) {
                      Image(systemName: "iphone")
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fit)
                            .cornerRadius(12)
                            .frame(height: 90)
                            .padding([.leading, .top, .bottom], 12)
                        Button(action: {}) {
                            Image("menu").renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.yellow)
                                .frame(height: 15)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 4)
                                .padding(.top, 2)
                        }
                        .background(.white)
                        .clipShape(Circle())
                        .padding(.top, 14)
                        .padding(.trailing, 4)
                        .frame(height: 44)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("data.title")
                            .font(.title3)
                            .lineLimit(20)
                        Text("test".uppercased())
                            .font(.title3)
                    }.padding(.leading, 5)
                    Spacer()
                }
                .cornerRadius(12)
            }
        }
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}



#Preview {
    ContentView()
}
