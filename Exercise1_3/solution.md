<b> Design a 2FA system (concept only, no code involved) between an Authenticator app and your app.

Steps involved:
Define how the 2FA will work ( what are the steps in order to validate a 2FA code and how the QR code works, how it compares and what exactly ).
Create a short diagram for the 2FA part (how to authentication works).</b>


1. Utilizatorul isi va activa 2FA (2 Factor Authenticator) pe contul sau, in general dintr-o sectiune a aplicatiei dedicata acestui proces. Astfel se va incepe procesul de setare a detaliilor aplicatiei 2FA.
2. Sistemul va genera o cheie secreta unica, de obicei codata in base-32 pe care o asociaza in mod automat cu contul utilizatorului care a creat-o.
3. Aplicatia va crea un cod QR bazat pe URI-ul <code>otpauth://totp/{NumeAplicatie}:{User}?secret={Secret}&issuer={NumeAplicatie}</code>, unde <code>Secret</code> reprezinta cheia secreta creata la pasul 2. Acest cod QR trebui scanat cu o aplicatie speciala pentru 2FA (cum ar fi Google Authenticator). Acesta va genera un nou cod o data la 30 de secunde ce poate fi folosit in procesul de autentificare la o noua sesiune.
