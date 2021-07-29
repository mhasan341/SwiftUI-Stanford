//
//  ContentView.swift
//  Memorize
//
//  Created by Mahmud on 2021-07-15.
//

import SwiftUI

struct ContentView: View {
    
    
    var emojis = ["🦆","🪲","🐝","🦂","🐛",
                  "🦋","🐒","🐔","🐧","🐤",
                  "🐣","🦅","🦉","🦇","🐺",
                  "🐗","🐴","🦄","🐞","🦑",
                  "🦐","🦞","🦀","🐡","🐏"]
    
    @State var emojiCount = 24
    
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 150))]){
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji).aspectRatio(2/3,contentMode: .fit)
                }
                
            }.foregroundColor(.red)
            }
            
            
            Spacer(minLength: 20)
            
            HStack{
                addButton
                Spacer()
                removeButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
            
            // end hstack
        }.padding(.horizontal)
        
   
    } // end of body
    
    var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            
                Image(systemName: "plus.circle")
            
        }
    }
    
    var removeButton: some View {
        Button {
            if emojiCount > 1{
                emojiCount -= 1
            }
            
        } label: {
            
                Image(systemName: "minus.circle")
            
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
               shape.strokeBorder(lineWidth: 2)
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
