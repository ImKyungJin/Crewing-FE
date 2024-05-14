import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = "" // TextField에 입력된 값을 저장
    @State private var categoryName: String = "" // 선택된 카테고리
    @State private var categoryIndex: Int = 0 // 선택된 카테고리의 인덱스
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                // * 로고
                HStack {
                    Text("Crewing")
                        .bold()
                        .font(.system(size: 32))
                        .padding()
                    Spacer()
                } // HStack
                .padding(.top)
                
                
                //ScrollView {
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
                } // ZStack
                .padding(.horizontal)
                
                
                // * 카테고리
                HStack {
                    Text("카테고리")
                        .bold()
                        .foregroundColor(Color("tertiary"))
                    Spacer()
                }
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 0, trailing: 20))
                
                
                HStack {
                    CategoryButton(imageName: "desktopcomputer", buttonName: "IT/데이터", destination: CategoryListView(categoryIndex: 1))
                    CategoryButton(imageName: "camera.fill", buttonName: "사진/촬영", destination: CategoryListView(categoryIndex: 2))
                    CategoryButton(imageName: "book", buttonName: "인문학/독서", destination: CategoryListView(categoryIndex: 3))
                    CategoryButton(imageName: "airplane", buttonName: "여행", destination: CategoryListView(categoryIndex: 4))
                    CategoryButton(imageName: "tennisball.fill", buttonName: "스포츠", destination: CategoryListView(categoryIndex: 5))
                }
                HStack {
                    CategoryButton(imageName: "pencil.and.scribble", buttonName: "문화/예술", destination: CategoryListView(categoryIndex: 6))
                    CategoryButton(imageName: "music.mic", buttonName: "댄스", destination: CategoryListView(categoryIndex: 7))
                    CategoryButton(imageName: "music.note.list", buttonName: "음악/악기", destination: CategoryListView(categoryIndex: 8))
                    CategoryButton(imageName: "figure.and.child.holdinghands", buttonName: "봉사활동", destination: CategoryListView( categoryIndex: 9))
                    CategoryButton(imageName: "list.dash", buttonName: "기타", destination: CategoryListView(categoryIndex: 10))
                }
                
                
                
                // * 추천 모집글
                HStack(spacing: 0) {
                    Text("김민아")
                        .bold()
                        .foregroundColor(Color("tertiary"))
                    Text("님에게 추천해요!")
                        .bold()
                        .foregroundColor(Color("tertiary"))
                    Spacer()
                    
                    // * 추천 모집글 더보기 버튼
                    NavigationLink(destination: RecommendedListView()) {
                        Image(systemName: "chevron.forward")
                            .padding(.horizontal)
                            .foregroundColor(Color("tertiary"))
                    }
                    
                }
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 10, trailing: 20))
                
                
                // * 추천 모집글 반복 호출
                ForEach(0..<3) { _ in
                    RecruitmentCardView()
                }
                
                //} // ScrollView
            } // body
        } // VStack
    }
}


struct CategoryButton <Destination: View>: View {
    
    var imageName: String
    var buttonName: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .foregroundColor(Color("secondary_"))
                    .frame(width: 22, height: 22)
                
                Text(buttonName)
                    .font(.system(size: 12))
                    .foregroundColor(Color("secondary_"))
                    .frame(width: 60, height: 15)
            }
            .frame(width: 60, height: 60)
        }
    }
}




#Preview {
    HomeView()
}

