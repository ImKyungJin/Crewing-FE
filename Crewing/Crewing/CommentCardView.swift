import SwiftUI

struct CommentCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("gray-10"))
            
            VStack {
                HStack(spacing:1) {
                    Text("0기 수료자")
                        .font(.system(size: 13))
                        .bold()
                        .padding(.trailing)
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(Color("starColor"))
                    }
                    Spacer()
                }
                
                HStack {
                    Text("커리큘럼대로 잘 운영되고, 친목도 적절하게 도모하고 있어서 좋았어요!")
                        .font(.system(size: 10))
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/) // 텍스트 길이에 따라 공간이 늘어나도록 함
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("2024/09/24")
                        .font(.system(size: 10))
                        .foregroundColor(Color("secondary_"))
                }
            }
            .padding(10)
            
        } // ZStack
        .frame(width: 350, alignment: .leading)
        .fixedSize() // 뷰를 이상적인 크기로 고정
        .padding(5)
    }
}

#Preview {
    CommentCardView()
}
