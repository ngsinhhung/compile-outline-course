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

document.addEventListener("DOMContentLoaded", async function () {
    let username = localStorage.getItem("username");
    if (!username) {
        username = prompt("Please enter your username:");
        localStorage.setItem("username", username);
    }

    const renderUsers = (users) => {
        const chatListContainer = document.querySelector('.chat-list');
        chatListContainer.innerHTML = ''; // Clear existing list

        users.forEach(user => {
            const { username: userUsername, avatar } = user.data;
            const userItem = document.createElement('li');
            userItem.classList.add('p-2', 'border-bottom');
            userItem.innerHTML = `
            <a href="#!" class="d-flex justify-content-between user-item" data-user-id="${user.id}">
                <div class="d-flex flex-row">
                    <div>
                        <img src="${avatar}" alt="avatar" class="d-flex align-self-center me-3 rounded-circle" width="60">
                    </div>
                    <div class="pt-1">
                        <p class="fw-bold mb-0">${userUsername}</p>
                    </div>
                </div>
            </a>
        `;
            chatListContainer.appendChild(userItem);
        });

        // Add event listeners to user items
        const userItems = document.querySelectorAll('.user-item');
        userItems.forEach(item => {
            item.addEventListener('click', async () => {
                const selectedUserId = item.getAttribute('data-user-id');
                await startChatWithUser(selectedUserId);
            });
        });
    };

    const usersRef = collection(db, "users");
    onSnapshot(usersRef, (snapshot) => {
        const users = [];
        snapshot.forEach(doc => {
            users.push({ id: doc.id, data: doc.data() });
        });
        renderUsers(users);
    }, error => {
        console.error("Error fetching users: ", error);
    });

    // Watch for real-time updates of rooms
    let currentRoomId = null;

    async function startChatWithUser(selectedUserId) {
        try {
            let roomRef = null;
            const roomQuery = query(
                collection(db, 'rooms'),
                where('members', 'array-contains', username)
            );
            const roomSnapshot = await getDocs(roomQuery);
            roomSnapshot.forEach(doc => {
                const room = doc.data();
                if (room.members.includes(selectedUserId)) {
                    roomRef = doc;
                }
            });

            if (!roomRef) {
                const roomData = {
                    members: [username, selectedUserId],
                    createdAt: serverTimestamp()
                };
                const newRoomRef = await addDoc(collection(db, 'rooms'), roomData);
                currentRoomId = newRoomRef.id;
            } else {
                currentRoomId = roomRef.id;
            }

            const messagesQuery = query(
                collection(db, 'messages'),
                where('roomId', '==', currentRoomId),
                orderBy('timestamp')
            );
            onSnapshot(messagesQuery, (querySnapshot) => {
                const messagesContainer = document.getElementById("chat-messages");
                messagesContainer.innerHTML = "";
                querySnapshot.forEach(doc => {
                    const message = doc.data(); // Lưu ý sự thay đổi ở đây
                    renderMessage(message.text, message.sender === username ? "message-outgoing" : "message-incoming", message.sender);
                });
                messagesContainer.scrollTop = messagesContainer.scrollHeight; // Auto-scroll to bottom
            });

        } catch (error) {
            console.error("Error starting chat: ", error);
        }
    }

    const renderMessage = (text, className, sender) => {
        const messagesContainer = document.getElementById("chat-messages");
        const messageElement = document.createElement("div");
        messageElement.classList.add("message", className);
        messageElement.innerHTML = `
            <div class="message-content">
                <p>${text}</p>
                <span class="message-time">${sender}</span>
            </div>
        `;
        messagesContainer.appendChild(messageElement);
    };

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

});
