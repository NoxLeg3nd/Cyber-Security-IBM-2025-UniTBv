<b> Design a 2FA system (concept only, no code involved) between an Authenticator app and your app.

Steps involved:
Define how the 2FA will work ( what are the steps in order to validate a 2FA code and how the QR code works, how it compares and what exactly ).
Create a short diagram for the 2FA part (how to authentication works).</b>

<i>A. Procesul de inrolare 2FA</i>
  1. Utilizatorul isi va activa 2FA (2 Factor Authenticator) pe contul sau, in general dintr-o sectiune a website-ului dedicata acestui proces. Astfel se va incepe procesul de setare a detaliilor aplicatiei 2FA.
  2. Sistemul va genera o cheie secreta unica codata in base-32 pe care o asociaza in mod automat cu contul utilizatorului care a creat-o.
  3. Website-ul va crea un cod QR bazat pe un URI asemeni acestuia <code>otpauth://totp/{NumeAplicatie}:{User}?secret={Secret}&issuer={NumeAplicatie}</code>, unde <code>Secret</code> reprezinta cheia secreta creata la pasul 2. Acest cod QR va trebui scanat cu o aplicatie speciala pentru 2FA (cum ar fi Google Authenticator sau Authy).
  4. Aplicatia 2FA va genera un nou cod TOTP(Time-based One-Time Password) o data la 30 de secunde ce poate fi folosit in procesul de autentificare la o noua sesiune.

<i>B. Login cu 2FA</i>
  1. Se va incepe autentificarea de catre utilizator la fel ca si cum metoda de 2FA nu ar fi activata.
  2. In urma introducerii tuturor datelor necesare autentificarii (username/e-mail/telefon si parola), daca acestea sunt corecte si valide, utilizatorul este informat asupra fatpului ca are nevoie de codul TOTP din aplicatia de autentificare setata anterior pentru a capata acces la website.
  3. Se acceseaza aplicatia de autentificare, se copiaza codul TOTP si se introduce in cadrul sectiunii de autentificare din website.
  4. Ultimul pas este reprezentat de validarea TOTP de catre server. Serverul care detine si el aceeasi cheie secreta pentru acel utilizator, genereaza independent propriul sau TOTP folosind acelasi algoritm (de obicei TOTP bazat pe HMAC-SHA1) si aceeasi cheie secreta care a fost partajata in timpul configurarii. De asemenea, se ia in considerare o fereastră de timp mica (de exemplu, 30 de secunde inainte si 30 de secunde dupa ora curenta) pentru a tine cont de posibilele diferente de ora intre dispozitivul utilizatorului si server.
  5. Daca codul 2FA generat de server in cazul pasului 4 se potriveste cu cel introdus de utilizator si generat de aplicatia 2FA atunci accesul utilizatorului la website va fi permis.
