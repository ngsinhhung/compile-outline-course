import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
import {
    getFirestore,
    collection,
    query,
    orderBy,
    where,
    onSnapshot,
    getDocs,
    serverTimestamp,
    addDoc
} from "https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js";
import {
    getStorage,
    ref,
    uploadBytesResumable,
    getDownloadURL
} from "https://www.gstatic.com/firebasejs/9.6.1/firebase-storage.js";

// Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyBRjcxoBo2ezaS89SwsrFAuEJ-4pd0sU6k",
    authDomain: "chatrealtime-cb6a0.firebaseapp.com",
    projectId: "chatrealtime-cb6a0",
    storageBucket: "chatrealtime-cb6a0.appspot.com",
    messagingSenderId: "156500470716",
    appId: "1:156500470716:web:1a180086bd4e4e056a19b9",
    measurementId: "G-DY06R8Q9NC",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
const storage = getStorage(app);

document.addEventListener("DOMContentLoaded", async () => {
    let username = localStorage.getItem("username");
    if (!username) {
        username = prompt("Please enter your username:");
        localStorage.setItem("username", username);
    }

    let currentRoomId = null; // To store the ID of the current chat room

    const renderMessage = (text, sender, timestamp) => {
        const messagesContainer = document.getElementById("chat-messages");
        const messageElement = document.createElement("div");
        messageElement.classList.add("message");

        if (sender === username) {
            messageElement.classList.add("message-incoming");
        } else {
            messageElement.classList.add("message-outgoing");
        }

        messageElement.innerHTML = `
            <div class="message-content">
                <p>${text}</p>
                <span class="message-time">${sender}, ${formatDate(timestamp)}</span>
            </div>
        `;

        messagesContainer.appendChild(messageElement);
        messagesContainer.scrollTop = messagesContainer.scrollHeight; // Auto-scroll to bottom
    };

    // Function to format timestamp
    const formatDate = (timestamp) => {
        return timestamp.toDate().toLocaleTimeString();
    };

    // Function to start a chat with a specific user or room
    const startChatWithUser = async (selectedId, isRoom = false) => {
        try {
            let roomId = selectedId;

            if (!isRoom) {
                // Check if there is an existing room with both users
                const roomQuery = query(
                    collection(db, 'rooms'),
                    where('members', 'array-contains', username)
                );
                const roomSnapshot = await getDocs(roomQuery);
                roomSnapshot.forEach(doc => {
                    const room = doc.data();
                    if (room.members.includes(selectedId)) {
                        roomId = doc.id;
                    }
                });

                // If no existing room found, create a new one
                if (selectedId !== roomId) {
                    const roomData = {
                        members: [username, username],
                        createdAt: serverTimestamp()
                    };
                    const newRoomRef = await addDoc(collection(db, 'rooms'), roomData);
                    roomId = newRoomRef.id;
                }
            }

            currentRoomId = roomId;

            // Set up listener for real-time messages in the current room
            const messagesQuery = query(
                collection(db, 'messages'),
                where('roomId', '==', currentRoomId),
                orderBy('timestamp')
            );
            onSnapshot(messagesQuery, (querySnapshot) => {
                const messagesContainer = document.getElementById("chat-messages");
                messagesContainer.innerHTML = "";
                querySnapshot.forEach(doc => {
                    const message = doc.data();
                    console.log(message)
                    renderMessage(message.text, message.sender, message.timestamp);
                });
            });

        } catch (error) {
            console.error("Error starting chat: ", error);
        }
    };

    // Event listener for the send button
    document.getElementById("send-button").addEventListener("click", async () => {
        const messageInput = document.getElementById("message-input");
        const text = messageInput.value.trim();

        if (text && currentRoomId) {
            try {
                await addDoc(collection(db, 'messages'), {
                    text: text,
                    sender: username,
                    roomId: currentRoomId,
                    timestamp: serverTimestamp()
                });

                messageInput.value = "";
            } catch (error) {
                console.error("Error sending message: ", error);
            }
        } else {
            console.log("Message input is empty or no room selected");
        }
    });

    // Function to render list of rooms
    const renderRooms = (rooms) => {
        const chatListContainer = document.querySelector('.chat-list');
        chatListContainer.innerHTML = ''; // Clear existing list

        rooms.forEach(room => {
            // Create room item element
            const roomItem = document.createElement('div');
            roomItem.classList.add('p-2', 'border-bottom');
            roomItem.innerHTML = `
                <a href="#!" class="d-flex justify-content-between room-item" data-room-id="${room.id}">
                    <div class="d-flex flex-row">
                        <div>
                            <img src="https://via.placeholder.com/60" alt="avatar" class="d-flex align-self-center me-3 rounded-circle" width="60">
                        </div>
                        <div class="pt-1">
                            <p class="fw-bold mb-0">${room.id}</p>
                        </div>
                    </div>
                </a>
            `;
            chatListContainer.appendChild(roomItem);

            // Add event listener to each room item
            roomItem.addEventListener('click', async (event) => {
                event.preventDefault(); // Prevent default link behavior
                const selectedRoomId = room.id;
                await startChatWithUser(selectedRoomId, true); // Pass true to indicate it's a room
            });
        });
    };

    // Function to fetch and render list of rooms initially
    const fetchUserRooms = async () => {
        try {
            const username = localStorage.getItem("username");
            if (!username) {
                console.log("Username not found in localStorage");
                return;
            }

            // Query rooms where current user is a member
            const roomsQuery = query(
                collection(db, 'rooms'),
                where('members', 'array-contains', username)
            );
            const roomsSnapshot = await getDocs(roomsQuery);
            const userRooms = [];
            roomsSnapshot.forEach(doc => {
                userRooms.push({ id: doc.id });
            });
            renderRooms(userRooms); // Render list of rooms where user is a member
        } catch (error) {
            console.error("Error fetching user's rooms: ", error);
        }
    };

    // Call function to fetch and render user's rooms when DOM is loaded
    fetchUserRooms();

});
