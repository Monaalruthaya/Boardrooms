//
//  MainScreen.swift
//  Boardrooms
//
//  Created by mona alruthaya on 20/07/1446 AH.
//
import SwiftUI

struct MainScreenView: View {
    var body: some View {
        ZStack {
            // Background color
            Color(hex: "#F3F3F3")
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // Header
                ZStack {
                    Color(hex: "#232455")
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 30)

                    Text("Board Rooms")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Featured Rectangle Section
                        ZStack {
                            Image("Availabletoday") // Replace with your image name
                                .resizable()
                                .scaledToFill()

                            HStack {
                                VStack(alignment: .leading) {
                                    Text("All board rooms")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)

                                    Text("Available today")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top, 4)

                                    Spacer()
                                }
                                .padding()

                                Spacer()

                                Button(action: {
                                    // Handle "Book now" button action
                                }) {
                                    Text("Book now")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.top, 70)
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(.white)
                                        .padding(.top, 70)

                                }
                                .padding()
                            }
                        }
                        .padding(.horizontal)

                        // My Booking Section
                        SectionHeaderView(title: "My booking", buttonText: "See All")

                        HorizontalScrollRoomCardView(rooms: [
                            Room(name: "Creative Space", floor: "Floor 5", date: "28 March", icon: "person.2.fill", count: "1", imageName: "creative_space")
                        ])

                        // All Bookings Section
                        SectionHeaderView(title: "All bookings for March", buttonText: "")

                        DateRowView()

                        // Room Cards
                        VStack(spacing: 16) {
                            RoomCardView(
                                room: Room(name: "Creative Space", floor: "Floor 5", status: "Available", statusColor: "#39D480", icon: "person.2.fill", count: "1", imageName: "creative_space", wifi: true)
                            )
                            RoomCardView(
                                room: Room(name: "Ideation Room", floor: "Floor 3", status: "Unavailable", statusColor: "#D43939", icon: "person.2.fill", count: "16", imageName: "ideation_room", wifi: true, tv: true)
                            )
                            RoomCardView(
                                room: Room(name: "Inspiration Room", floor: "Floor 1", status: "Unavailable", statusColor: "#D43939", icon: "person.2.fill", count: "18", imageName: "inspiration_room", wifi: true, mic: true, webcam: true)
                            )
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

// MARK: - Subviews

struct SectionHeaderView: View {
    var title: String
    var buttonText: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#232455"))

            Spacer()

            if !buttonText.isEmpty {
                Button(action: {
                    // Handle See All
                }) {
                    Text(buttonText)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "#D45E39"))
                }
            }
        }
        .padding(.horizontal)
    }
}

struct HorizontalScrollRoomCardView: View {
    var rooms: [Room]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(rooms, id: \.name) { room in
                    RoomCardView(room: room)
                        .frame(width: 370)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct RoomCardView: View {
    var room: Room

    var body: some View {
        HStack {
            Image(room.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                Text(room.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#232455"))

                Text(room.floor)
                    .font(.footnote)
                    .foregroundColor(.gray)

                HStack {
                    Image(systemName: room.icon)
                        .foregroundColor(.gray)

                    Text(room.count)
                        .font(.footnote)
                        .foregroundColor(.gray)

                    if room.wifi {
                        Image(systemName: "wifi")
                            .foregroundColor(.gray)
                    }
                    if room.tv {
                        Image(systemName: "tv")
                            .foregroundColor(.gray)
                    }
                    if room.mic {
                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                    }
                    if room.webcam {
                        Image(systemName: "video.fill")
                            .foregroundColor(.gray)
                    }
                }
            }

            Spacer()

            if let status = room.status {
                Text(status)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: room.statusColor ?? "#D43939"))
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex: room.statusColor ?? "#D43939").opacity(0.2))
                    )
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct DateRowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(1..<31, id: \.self) { day in
                    
                    VStack {
                        Text("Thu") // Replace with real logic
                            .font(.footnote)
                            .foregroundColor(day == 16 ? .white : .gray)

                        Text("\(day)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(day == 16 ? .white : .gray)
                    }
                    .frame(width: 35, height: 35)
                    .background(day == 16 ? Color(hex: "#D45E39") : Color.white)
                    .cornerRadius(100)
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Room Model
struct Room {
    var name: String
    var floor: String
    var date: String? = nil
    var status: String? = nil
    var statusColor: String? = nil
    var icon: String
    var count: String
    var imageName: String
    var wifi: Bool = false
    var tv: Bool = false
    var mic: Bool = false
    var webcam: Bool = false
}



// MARK: - Preview
struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
