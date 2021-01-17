//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/17.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    //햅틱 피드백 적용
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    var range: ClosedRange<Int> = 1...20 // 수량 선택 가능 범위
    
    var body: some View {
        HStack{
            Button(action: {
                self.changeQuantity(-1)
            }){
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
            
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(minWidth: 40, maxWidth: 60)
            
            Button(action: {
                self.changeQuantity(1)
            }){
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
        }
    }
    
    private func changeQuantity(_ num: Int){
        if range ~= quantity + num{ // range가 해당 범위 내에 있는지
            quantity += num
            softFeedback.prepare()//진동 지연 시간을 줄일 수 있도록 미리 준비
            softFeedback.impactOccurred(intensity: 0.7)//진동 세기 0.7
        } else{
            rigidFeedback.prepare()
            rigidFeedback.impactOccurred()
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
//    @State private var quantity = 0
    //인스턴스 프로퍼티인 quantity는 타입 프로퍼티로 선언된 previews 내에서 사용 불가
    //프리뷰에서 Binding 타입에 값 전달할 때는 constant를 이용
    static var previews: some View {
        Group{
            QuantitySelector(quantity: .constant(1))
            QuantitySelector(quantity: .constant(10))
            QuantitySelector(quantity: .constant(20))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
