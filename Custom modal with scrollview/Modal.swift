//
//  Modal.swift
//  Custom modal with scrollview
//
//  Created by Yajima Youhei on 2021/10/23.
//

import SwiftUI
@available(iOS 15.0, *)
struct Modal: View {
    let screenSize = UIScreen.main.bounds
    @State var offset: CGFloat = .zero
    @Binding var showModal: Bool
    
    var body: some View {
         VStack {
             ScrollView(.vertical, showsIndicators: false) {
                Text("ModalView")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                
            }
            .frame(width: screenSize.width, height: screenSize.height*0.5)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .frame(height: screenSize.height, alignment: .bottom)
            .gesture(dragGesture)
            .offset(y: offset)
        }
    }
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if val.translation.height > 0 {
                    self.offset =  val.translation.height
                }
                
            }
            .onEnded { val in
                if self.offset > screenSize.height * 0.25 {
                    showModal = false
                    self.offset = .zero
                } else {
                    self.offset = .zero
                }
            }
        
    }
    
}


@available(iOS 15.0, *)
struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal(showModal: .constant(true))
    }
}
