//
//  ContentView.swift
//  Memorize
//
//  Created by Mahmud on 2021-07-15.
//

import SwiftUI

struct ContentView: View {
    
    
    var emojis = ["🦆","🪲","🐝","🦂","🐛","🦋","🐒","🐔","🐧","🐤","🐣","🦅","🦉","🦇","🐺","🐗","🐴","🦄","🐞","🦑","🦐","🦞","🦀","🐡"]
    
    @State var emojiCount = 6
    
    var body: some View {
        
        VStack{
            HStack{
                
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
                
            }
            
            HStack{
                Button(action: {
                    emojiCount += 1
                }, label: {
                    VStack{
                        Text("Add")
                        Text("Card")
                    }
                })
                Spacer()
                Button(action: {
                    emojiCount -= 1
                }, label: {
                    VStack{
                        Text("Remove")
                        Text("Card")
                    }
                })
            }
            .padding(.horizontal)
            .foregroundColor(.red)
        }
        

    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    
    var body: some View{
        
        let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack(content: {
        if isFaceUp {
            shape.fill().foregroundColor(.white)
               shape.stroke(lineWidth: 2)
               Text(content).font(.largeTitle)
            
        }else{
            shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
            
        }).onTapGesture {
            isFaceUp = !isFaceUp
        }

    }
    
}













struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
        ContentView()
            .preferredColorScheme(.light)
    }
}
