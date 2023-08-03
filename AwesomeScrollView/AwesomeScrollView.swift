//
//  AwesomeScrollView.swift
//  AwesomeScrollView
//
//  Created by Nao RandD on 2023/08/03.
//

import SwiftUI

struct AwesomeScrollView: View {

    struct Section: Identifiable {
        let id = UUID()
        let title: String
        let text: String
        let logo: Image
        let image: Image
        let color: Color
    }

    let sections = [
        Section(title: "コンテンツ①", text: "一つ目のコンテンツ", logo: Image(uiImage: #imageLiteral(resourceName: "Logo")),
                image: Image(uiImage: #imageLiteral(resourceName: "Background")), color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
        Section(title: "コンテンツ②", text: "二つ目のコンテンツ", logo: Image(uiImage: #imageLiteral(resourceName: "Logo")),
                image: Image(uiImage: #imageLiteral(resourceName: "Background")), color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))),
        Section(title: "コンテンツ③", text: "三つ目のコンテンツ", logo: Image(uiImage: #imageLiteral(resourceName: "Logo")),
                image: Image(uiImage: #imageLiteral(resourceName: "Background")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
        Section(title: "コンテンツ④", text: "四つ目のコンテンツ", logo: Image(uiImage: #imageLiteral(resourceName: "Logo")),
                image: Image(uiImage: #imageLiteral(resourceName: "Background")), color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))),
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(sections) { section in
                    GeometryReader { geometry in
                        makeSection(section: section)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(width: 275, height: 275)
                }
            }
            .padding(30)
            .padding(.bottom, 30)
        }
    }

    @ViewBuilder
    func makeSection(section: Section) -> some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                section.logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }

            Text(section.text)
                .font(.system(size: 15, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)

            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct AwesomeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        AwesomeScrollView()
    }
}
