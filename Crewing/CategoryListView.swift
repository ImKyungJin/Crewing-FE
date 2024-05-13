import SwiftUI

struct CategoryListView: View {
    
    @State var categoryName : String
    
    @State private var searchText: String = "" // TextField에 입력된 값을 저장
    
    @State private var selectedCategoryIndex = 0
    
    // 드롭다운 목록에 표시될 항목들
    let categories = ["전체", "IT/데이터", "사진/촬영", "인문학/독서", "여행", "스포츠", "문화/예술", "댄스", "음악/악기", "봉사활동", "기타"]
    
    // 모집 중 토글의 상태
    @State private var isToggled = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    var body: some View {
  
        ZStack {
            // * 뒤로가기 버튼
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()}) {
                    HStack(spacing:2) {
                        Image(systemName: "chevron.backward")
                        Text("홈")
                            .font(.system(size: 15))
                        Spacer()
                    }
                    .foregroundColor(.black)
                }

            // * 리스트 제목
            Text("\(categoryName)")
                .font(.system(size: 18))
                .bold()
        }
        .padding(20)
        .navigationBarBackButtonHidden() // 뒤로가기 버튼 숨기기
        
        
        ScrollView {
            VStack {
                // * 검색창
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("primary_"))
                        .frame(width: 350, height: 45)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("secondary_"))
                        TextField("후기가 궁금한 연합 동아리를 검색해보세요 :)", text: $searchText)
                            .foregroundColor(Color("secondary_"))
                            .font(.system(size: 12))
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                
                
                HStack {
                    // * 카테고리 드롭다운
                    Picker("?", selection: $selectedCategoryIndex) {
                        ForEach(0..<categories.count) { index in
                            Text(categories[index])
                        }
                    }
                    .pickerStyle(.menu) // 드롭다운 스타일 설정
                    .accentColor(.gray)
                    .padding(5)
                    
                    Spacer()
                    
                    // * 모집중 토글
                    Toggle("모집 중", isOn: $isToggled)
                        .font(.system(size: 13))
                        .frame(width: 95)
                        .padding(10)
                        .tint(Color("accent"))
                            
                } // HStack
                
                // * 추천 모집글 반복 호출
                ForEach(0..<20) { _ in
                    RecruitmentCardView()
                }
                
            } // VStack
        } // ScrollView
    } // body
}


#Preview {
    CategoryListView(categoryName: "카테고리 이름")
}
