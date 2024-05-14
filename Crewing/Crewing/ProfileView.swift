import SwiftUI

struct ProfileView: View {
    
    @State private var isEditingInterests = false // 관심항목 수정 여부
    @State private var selectedCategories: Set<String> = ["IT/데이터", "사진/촬영"] // 선택된 카테고리

    let categories = ["전체", "IT/데이터", "사진/촬영", "인문학/독서", "여행", "스포츠", "문화/예술", "댄스", "음악/악기", "봉사활동", "기타"]
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                // * 동아리 등록 텍스트
                HStack {
                    Spacer()
                    Text("동아리를 등록하시겠습니까?")
                        .font(.system(size: 10, weight: .thin))
                        .foregroundStyle(Color("accent"))
                        .underline()
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 20))
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 20))
                        .frame(height: 260)
                        .foregroundColor(Color("primary_"))
                    
                    VStack {
                        
                        // * 사람 아이콘
                        ZStack {
                            Circle()
                                .frame(width: 80, height:80)
                                .foregroundColor(.white)
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        
                        // * 이름
                        Text("이름")
                            .bold()
                            .font(.system(size: 20))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        
                        // * 회원 코드
                        HStack(spacing:0) {
                            Text("#")
                                .font(.system(size: 13))
                                .foregroundColor(Color("secondary_"))
                            Text("0000")
                                .font(.system(size: 13))
                                .foregroundColor(Color("secondary_"))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        
                        // 관심항목 수정하기 버튼 활성화
                        if isEditingInterests {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    // 관심항목 띄우기
                                    ForEach(categories, id: \.self) { category in
                                        Button(action: {
                                            // 버튼 클릭시
                                            if selectedCategories.contains(category) {
                                                selectedCategories.remove(category)
                                            } else {
                                                selectedCategories.insert(category)
                                            }
                                        }) {
                                            // 항목 형태
                                            Text(category)
                                                .font(.system(size: 9))
                                                .padding(5)
                                                .foregroundColor(Color.black)
                                                .cornerRadius(5)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 5)
                                                        .stroke(selectedCategories.contains(category) ? Color("tertiary") : Color.clear, lineWidth: 1.5)
                                                        .background(Color.white)
                                                )
                                                .foregroundColor(selectedCategories.contains(category) ? .black : .secondary)
                                                .cornerRadius(5)
                                        }
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                        }
                        
                        // 관심항목 수정하기 버튼 비활성화
                        if !isEditingInterests {
                                HStack {
                                    ForEach(Array(selectedCategories), id: \.self) { selectedCategory in
                                        Text(selectedCategory)
                                            .font(.system(size: 9))
                                            .padding(5)
                                            .foregroundColor(Color.black)
                                            .background(Color.white)
                                            .cornerRadius(5)
                                    }
                                }
                        }
                        
                        // * 관심항목 수정 버튼
                        Button(action: {
                            // 버튼 액션
                            isEditingInterests.toggle()
                        }) {
                            Text(isEditingInterests ? "저장하기" : "관심항목 수정하기")
                                .font(.system(size: 9))
                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            //.background(Color.white)
                                .foregroundColor(Color.black)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("tertiary"), lineWidth: 1)
                                )
                        }
                    }
                } // ZStack
                
                // * 활동 중인 동아리
                HStack(spacing: 0) {
                    Text("활동 중인 동아리")
                        .bold()
                        .font(.system(size: 16))
                    Spacer()
                    NavigationLink(destination: MyClubsView()) {
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color.black)
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                
                HStack {
                    ClubButton(imageName: "dummy", clubName: "노스페어스", destination: CategoryListView(categoryIndex: 6))
                    ClubButton(imageName: "dummy", clubName: "노스페어스", destination: CategoryListView(categoryIndex: 6))
                    ClubButton(imageName: "dummy", clubName: "노스페어스", destination: CategoryListView(categoryIndex: 6))
                    ClubButton(imageName: "dummy", clubName: "노스페어스", destination: CategoryListView(categoryIndex: 6))
                }
                
                Spacer()
            } // VStack
        } // NavigationView
    } // body
}



struct ClubButton <Destination: View>: View {
    
    var imageName: String
    var clubName: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 68, height: 68)
                
                Text(clubName)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                    .frame(width: 68)
            }
            .padding(8)
        }
    }
}




#Preview {
    ProfileView()
}
