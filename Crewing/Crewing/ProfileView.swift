//
//  ProfileView.swift
//  Crewing
//
//  Created by 임경진 on 5/13/24.
//

import SwiftUI

struct ProfileView: View {
    
    
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
                        .padding(.horizontal)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
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
                        .padding(3)
                        
                        // * 이름
                        Text("이름")
                            .bold()
                            .font(.system(size: 20))
                        
                        // * 회원 코드
                        HStack(spacing:0) {
                            Text("#")
                                .font(.system(size: 13))
                                .foregroundColor(Color("secondary_"))
                            Text("0000")
                                .font(.system(size: 13))
                                .foregroundColor(Color("secondary_"))
                        }
                        
                        // * 관심 항목
                        HStack {
                            Text("\(categories[1])")
                                .font(.system(size: 9))
                                .padding(3)
                                .background(Color.white)
                                .foregroundColor(Color("secondary_"))
                                .cornerRadius(5)
                            Text("\(categories[2])")
                                .font(.system(size: 9))
                                .padding(3)
                                .background(Color.white)
                                .foregroundColor(Color("secondary_"))
                                .cornerRadius(5)
                        }
                        .padding(3)
                        
                        // * 관심항목 수정 버튼
                        Button(action: {
                            // 버튼 액션
                        }) {
                            Text("관심항목 수정하기")
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
