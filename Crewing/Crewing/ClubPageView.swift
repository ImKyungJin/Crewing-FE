import SwiftUI
import Charts


enum tapInfo : String, CaseIterable {
    case info = "소개"
    case comments = "후기"
}

let ratings: [String: Double] = ["1점": 4, "2점": 0, "3점": 8, "4점": 75, "5점":56] // 예시 데이터


struct ClubPageView: View {
    
    //@State private var infoTextEdit: String = "" 동아리 소개탭 편집시 사용
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedPicker: tapInfo = .info
    @Namespace private var animation
    
    
    @ViewBuilder // 뷰 생성시 전달받은 함수를 통해 하나 이상의 자식 뷰를 만드는데 사용
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.system(size: 13))
                        .bold()
                        .padding(.top)
                        .frame(maxWidth: .infinity/2, minHeight: 30)
                        .foregroundColor(selectedPicker == item ? Color("accent") : .gray)

                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(Color("accent"))
                            .frame(width: 175 , height: 3, alignment: .center)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                    if selectedPicker != item {
                        Capsule()
                            .foregroundColor(Color("gray-60"))
                            .frame(width: 175 , height: 3, alignment: .center)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
    }
    
    

    // * 화면을 구성하는 View 코드 부분
    var body: some View {
        VStack {
            // * 뒤로가기 버튼
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()}) {
                    HStack(spacing:2) {
                        Image(systemName: "chevron.backward")
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 10, trailing: 0))
                }
            
            ScrollView {
                ZStack (alignment: .bottom) {
                    // * 동아리 이미지
                    RoundedRectangle(cornerRadius: 10)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                        .frame(height: 220)
                        .foregroundColor(Color("tertiary"))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 70)
                            .padding(EdgeInsets(top: 0, leading: 35, bottom: 30, trailing: 35))
                            .foregroundColor(Color.white)
                        
                        // * 동아리 이름 및 한 줄 소개
                        VStack {
                            HStack {
                                Text("동학대학운동")
                                    .font(.system(size: 14))
                                    .bold()
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 1, trailing: 0))
                            HStack {
                                Text("사이드 프로젝트 진행하는 IT동아리")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("secondary_"))
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        }
                        .padding(EdgeInsets(top: 0, leading: 35, bottom: 30, trailing: 35))
                        
                    } // ZStack
                    .frame(height: 100)
                } // ZStack
                .frame(height: 220)
                
                
                ZStack(alignment: .top) {
                    // * 탭 배경
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width) // 화면 너비와 일치하도록 설정
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: -5)
                    
                    // * 탭
                    VStack {
                        animate()
                        InfoAndCommentsView(tabState: selectedPicker)
                    }
                }
            } // ScrollView
        } // VStack
        .navigationBarBackButtonHidden() // 뒤로가기 버튼 숨기기
    } // body
}


// * 리뷰 차트 구성
struct RatingBarChartView: View {
    let ratings: [String: Double] // 각 별점 항목과 해당 수치
    
    var body: some View {
        VStack {
            let maxValue = ratings.values.max() ?? 1 // 최댓값, 0으로 나누는 것을 방지하기 위해 1로 설정
            ForEach(ratings.sorted(by: { $0.key < $1.key }), id: \.key) { (label, value) in
                HStack (spacing:1) {
                    // "1점", "2점", "3점", "4점", "5점"
                    Text(label)
                        .padding(.leading)
                        .font(.system(size: 10))
                        .bold()
                        .foregroundColor(Color("tertiary"))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                    // 막대 바
                    BarView(value: value, maxValue: maxValue)
                    // 리뷰 개수
                    Text("\(Int(value))")
                        .font(.system(size: 10))
                        .bold()
                        .foregroundColor(Color("tertiary"))
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    Spacer()
                }
            }
        }
        .frame(width: 170, height: 150)
    }
}


// * 막대 그래프 그리기
struct BarView: View {
    let value: Double
    let maxValue: Double
    
    var body: some View {
        if value == 0 { // 모든 값이 0인 경우도 고려
            let barWidth = CGFloat(value / maxValue) * 80 // 최댓값을 기준으로 비율 계산
            return AnyView(
                HStack {
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 80, height: 10)
                            .foregroundColor(.white)
                    }
                }
            )
        } else {
            let barWidth = CGFloat(value / maxValue) * 80 // 최댓값을 기준으로 비율 계산
            return AnyView(
                HStack {
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 80, height: 10)
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: barWidth, height: 10)
                            .foregroundColor(.yellow)
                    }
                }
            )
        }
    }
}

// Picker를 클릭했을때 그 Picker에 맞는 뷰 띄우기
struct InfoAndCommentsView : View {
    
    var tabState : tapInfo
    
    // 별점 평균과 관련된 변수들을 선언
    var totalSum: Double
    var totalCount: Double
    var average: Double
    var integerPart: Int
    var decimalPart: Int
    var starCount: Int
    var remainingStarCount: Int
    
    // 초기화 시 평균과 관련된 변수들을 계산
    init(tabState: tapInfo) {
        self.tabState = tabState
        self.totalSum=0
        self.totalCount=0
        self.average=0
        self.integerPart=0
        self.decimalPart=0
        self.starCount=0
        self.remainingStarCount=0

        for (key, value) in ratings {
            let removedDot = key.filter { !$0.isLetter } // "5점" 문자열에서 "5"만 추출하기
            if let intValue = Int(removedDot) { // 문자열 "5"를 정수로 변환
                totalSum += Double(intValue) * value
                totalCount += value
            } else {
                print("Error: Cannot convert \(removedDot) to integer")
            }
        }
        
        average = totalSum / totalCount
        integerPart = Int(average)
        decimalPart = Int((average - Double(integerPart)) * 10)
        starCount = min(integerPart, 5)
        remainingStarCount = max(0, 5 - starCount)
    }


    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch tabState {
            // * 소개 탭
            //case .info:
            case .comments:
                ZStack (alignment: .top) {
                    ScrollView {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color("content-secondary"), lineWidth: 2)
                            Text("시작\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n\n.\n.\n.\n.\n.\n.\n끝")
                                .font(.system(size: 16))
                                .padding()
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    }
//                        RoundedRectangle(cornerRadius: 100)
//                            .foregroundColor(.blue)
//                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30)
                } // ZStack
                
            // * 후기 탭
            //case .comments:
            case .info:
                ScrollView {
                    // * 후기 작성하기 버튼
                    HStack {
                        Spacer()
                        Text("후기 작성하기")
                            .underline()
                            .font(.system(size: 11))
                            .foregroundColor(Color("accent"))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 15))
                    }
                    
                    // * 후기 평점 차트
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(
                                AngularGradient(gradient: Gradient(colors: [Color.white, Color("gradationBlue")]), center: .topLeading, angle: .degrees(180 + 45))
                            )
                            .frame(width: .infinity, height: 150)
                            .padding(.horizontal)
                        
                        HStack {
                            // 별점 평균 수치 및 별 아이콘
                            VStack {
                                Text("\(integerPart).\(decimalPart)") // 평균 점수 표시
                                    .font(.system(size: 35))
                                    .bold()

                                HStack(spacing: 1) {
                                    ForEach(0..<starCount, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                    ForEach(0..<remainingStarCount, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .frame(width: 170)

                            // 중앙 구분선
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 1, height: 90)
                                .foregroundColor(.white)

                            // 별점 항목별 수치
                            RatingBarChartView(ratings: ratings)
                        }
                    }
                    .padding(.bottom)
                    
                    ForEach(0..<5) { _ in
                        CommentCardView()
                    }
                    
                } // ScrollView
            }
        }
    }
}

#Preview {
    ClubPageView()
}
