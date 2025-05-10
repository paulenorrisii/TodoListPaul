//
//  NoItemsView.swift
//  TodoListPaul
//
//  Created by Paul Norris on 5/7/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
            
            Text("No items to show")
                .font(.headline)
                .fontWeight(.semibold)
            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddListViewPaul(),
                               label: {
                    Text("Add Item 👍🏼")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) :
                        Color.accentColor.opacity(0.7),
                    radius: 10,
                    x:0.0,
                    y: animate ? 50: 30)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)
        }
            .frame(maxWidth: 400)
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        
        NoItemsView()
    }
}
