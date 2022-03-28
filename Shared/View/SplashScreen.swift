//
//  SplashScreen.swift
//  SplashScreen_solo (iOS)
//
//  Created by 하명관 on 2022/03/28.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var startAnimation = false
    @State var bowAnimation = false
    
    
    
    var body: some View {
        
        ZStack{
            
            Color("BG")
                .ignoresSafeArea()
            
            GeometryReader{ proxy in
                
                let size = proxy.size
                
                ZStack{
                    
                    Circle()
                        
                        .trim(from: 0, to: 2)
                        .stroke(
                            .linearGradient(.init(colors: [
                                
                                Color("Gradient1"),
                                Color("Gradient2"),
                                Color("Gradient3"),
                                Color("Gradient4"),
                                Color("Gradient5")
                                
                            ]), startPoint: .leading, endPoint: .trailing),
                            style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                        
                        )
                        .overlay(
                            
                            Circle()
                                .fill(Color.black)
                                .frame(width: 6, height: 6)
                                .overlay(
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 70, height: 70)
                                )
                                .blur(radius: 2.5)
                                .offset(x: (size.width / 2.4 ) )
                                .rotationEffect(.init(degrees: bowAnimation ? 360 : 0))
                        )
                        .frame(width: size.width/1.2, height: size.height/1.9)
                        .rotationEffect(.init(degrees: 360))
                        .offset(y:0)
                        

                    
                    
                    HStack(spacing: -20){
                        
                        Image("disney")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size.width/1.9, height: size.height/1.9)
                            .opacity(bowAnimation ? 1 : 0)
                        
                        Image("plus")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        
                    }
                    .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                
            }
            
            
        }
        .onTapGesture(){
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                
                withAnimation(.linear(duration: 2)){
                    bowAnimation.toggle()
                    
                }
            }
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
