//
//  Main.swift
//  Custom modal with scrollview
//
//  Created by Yajima Youhei on 2021/10/23.
//

import SwiftUI
@available(iOS 15.0, *)
struct Main: View {
    
    @State var showModal = false
    @State var offset: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                Button(action: {
                    withAnimation {
                        showModal.toggle()
                    }
                }) {
                        Text("Show ModalView")
                            .font(.title)
                            .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(.top, 100)
                    
                }
                Spacer()
            }
            
            Modal(showModal: $showModal)
                .offset(y: showModal ? .zero : UIScreen.main.bounds.height)
             
        }
    }
}


@available(iOS 15.0, *)
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
