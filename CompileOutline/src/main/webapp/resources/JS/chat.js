import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
import { getFirestore, collection, query, orderBy, onSnapshot, serverTimestamp, addDoc } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js";
import { getStorage, ref, uploadBytesResumable, getDownloadURL } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-storage.js";

const firebaseConfig = {
    apiKey: "AIzaSyBRjcxoBo2ezaS89SwsrFAuEJ-4pd0sU6k",
    authDomain: "chatrealtime-cb6a0.firebaseapp.com",
    projectId: "chatrealtime-cb6a0",
    storageBucket: "chatrealtime-cb6a0.appspot.com",
    messagingSenderId: "156500470716",
    appId: "1:156500470716:web:1a180086bd4e4e056a19b9",
    measurementId: "G-DY06R8Q9NC",
};

// Initialize Firebase app
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
const storage = getStorage(app);

const user1 = "Minh Tam";

const messagesRef = collection(db, "messages");

onSnapshot(query(messagesRef, orderBy("timestamp")), snapshot => {
    const messagesContainer = document.getElementById("chat-messages");
    messagesContainer.innerHTML = "";
    snapshot.forEach(doc => {
        const message = doc.data();
        const messageElement = document.createElement("div");
        messageElement.classList.add("message", message.sender === user1 ? "message-outgoing" : "message-incoming");
        messageElement.innerHTML = `
            <div class="message-content">
                <p>${message.text ? message.text : ''}</p>
                ${message.imageUrl ? `<img src="${message.imageUrl}" alt="sent-image">` : ''}
                <span class="message-time">${message.timestamp ? new Date(message.timestamp.seconds * 1000).toLocaleTimeString() : ''}</span>
            </div>
        `;
        messagesContainer.appendChild(messageElement);
    });
}, error => {
    console.error("Error fetching messages: ", error);
});

// Send a new message
document.getElementById("send-button").addEventListener("click", async () => {
    const messageInput = document.getElementById("message-input");
    const fileInput = document.getElementById("file-input");
    const text = messageInput.value.trim();
    const file = fileInput.files[0];

    if (text || file) {
        try {
            let imageUrl = null;

            if (file) {
                const storageRef = ref(storage, 'images/' + file.name);
                const uploadTask = uploadBytesResumable(storageRef, file);
                const snapshot = await uploadTask;
                imageUrl = await getDownloadURL(snapshot.ref);
            }

            await addDoc(messagesRef, {
                text: text,
                sender: user1,
                imageUrl: imageUrl,
                timestamp: serverTimestamp()
            });
            console.log("Message sent successfully");
            messageInput.value = "";
            fileInput.value = "";
        } catch (error) {
            console.error("Error sending message: ", error);
        }
    } else {
        console.log("Message input or file input is empty");
    }
});
