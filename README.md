# Mazi

---

## To run frontend

First `cd client`. \
Then run `flutter pub get` on your terminal. \
Next open an android emulator or connect your phone with USB Debugging turned on. \
Lastly, run `flutter run -v` on your terminal. \

## To run backend

First `cd server`. \
Then run `python -m venv env` to create a virtual environment in the folder. \
Next run `source env/Scripts/activate` if you are on windows (using git bash). Or `source env/bin/activate` if you are using a unix based terminal. \
Next run `pip install -r requirements.txt` to install all the necessary packages. \
Lastly run `uvicorn app.main:app --reload` to activate the backend on `localhost:8000`. \

## Software prerequisites

- Flutter
- Python
- MongoDB
- Android Studio for Android SDK
- Xcode for IOS Simulator
