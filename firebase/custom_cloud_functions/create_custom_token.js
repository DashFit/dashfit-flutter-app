const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const cors = require("cors")({ origin: true });

exports.createCustomToken = functions
  .region("us-central1")
  .https.onCall(async (data, context) => {
    return cors(req, res, async () => {
      const phoneNumber = data.phoneNumber;

      if (phoneNumber === undefined) {
        throw new functions.https.HttpsError(
          "invalid-argument",
          "uid not provided",
        );
      }
      try {
        // Create the custom token
        const uid = "phone:" + phoneNumber; // Use phone number as UID
        const customToken = await admin.auth().createCustomToken(uid);

        return {
          token: customToken,
        };
      } catch (error) {
        // Handle any errors
        console.log("Error generating custom token: ", error);
        throw new functions.https.HttpsError(
          "internal",
          "Failed to create new token",
        );
      }
    });
  });
