# mapbox_nav_starterpack

A complete starter pack for mapbox:
-polyline
-sreach
-calculate of time travel + km
-navigation

## Getting Started
How to use it ?

Etape 1 git clone

Etape 2 https://www.mapbox.com/
	- créer un compte
	- Creer un token -> cocher DOWNLOAD:REAd
	- Récuperer les TOKENS "Default public token" & "SECRET TOKEN"

Etape 3 Aller dans: assets/config/-env -> rentrer le PUBLIC TOKEN

Etape 4 Settings Android:
	- android/gradle.properties: MAPBOX_DOWNLOADS_TOKEN = SECRET TOKEN
	- android\app\src\main\res\values\strings.xml : <string name="mapbox_access_token" translatable="false">PUBLIC TOKEN</string>
  
Etape 5 Setting IOS:
	- <key>MGLMapboxAccessToken</key> remplacer le string par PUBLIC TOKEN
	- En dessous de </plist>: machine api.mapbox.com
						login mapbox
						password SECRET TOKEN
            
Etape 6: flutter app settings:
  - List of things to do for customize the projet: 
  - package + app rename: https://pub.dev/packages/rename + need to make a sreach into the android folder wwith the previus package name and change it to the new one
  - splash: https://pub.dev/packages/flutter_native_splash
  - icon: https://pub.dev/packages/flutter_launcher_icons
  - don't forget to use flutter clean     &&    flutter pub get     before lauching the projet on device



