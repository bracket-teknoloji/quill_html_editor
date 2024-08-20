importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyDJju4WmLMseTy43xGzs_jpz88PNWAzKrM",
    authDomain: "flutter-picker.firebaseapp.com",
    projectId: "flutter-picker",
    storageBucket: "flutter-picker.appspot.com",
    messagingSenderId: "9609536428",
    appId: "1:9609536428:web:efedff6e607b9f58579009",
    measurementId: "G-E5TVWFV72N"
  });

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});