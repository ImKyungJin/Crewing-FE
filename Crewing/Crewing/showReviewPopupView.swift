import SwiftUI


// 동아리 수료자에게 뜨는 리뷰 작성 팝업창
struct showReviewPopupView: View {
    
    @State private var reviewText: String = "" // TextField에 입력된 값을 저장
    @State private var rating: Int = 0 // 사용자 평점
    let maxLength = 200 // 최대 글자 길이
    
    var body: some View {
        VStack {
            Text("후기 쓰기")
                .font(.system(size: 18))
                .bold()
            
            HStack {
                ForEach(1...5, id: \.self) { index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(index <= rating ? Color("starColor") : .gray)
                                        .onTapGesture {
                                            rating = index
                                        }
                                }
            }
            .padding(.bottom)
            
            ZStack (alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("content-secondary"), lineWidth: 0.5)
                    .frame(width: 300, height: 170)
                TextEditor(text: $reviewText)
                    .padding(5)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .frame(width: 300, height: 170, alignment: .top)
                    .onChange(of: reviewText) { newValue in
                        if newValue.count > maxLength {
                            reviewText = String(newValue.prefix(maxLength))
                        }
                    }
            }
            .frame(width: 300, height: 170)
            
            HStack {
                Spacer()
                Text("\(reviewText.count)/200")
                    .font(.system(size: 10))
            }
            .frame(width: 300)
            .padding(.bottom)
            
            Button(action: {
                }) {
                    ZStack {
                        RoundedRectangle (cornerRadius: 10)
                            .stroke(Color("accent"), lineWidth: 1)
                            .frame(width: 200, height: 40)
                        Text("후기 등록하기")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .bold()
                    }
                }
            
        }
    }
}
#Preview {
    showReviewPopupView()
}
