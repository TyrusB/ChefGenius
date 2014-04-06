= Chef Genius

Allows users to submit recipes for other users to annotate, using a highlighting UI similar to Rap Genius.


== Version Information:
* Ruby: 1.9.3
* Rails: 4.0.2

== Dependencies of Note:
* devise - User Authentication
* cancan - User Authorization
* figaro - Safe key storage
* paperclip - Image uploading
* aws-sdk - Image storage through Amazon S3
* pg - uses PostgreSQL for database

== Points of Interest:
* [Annotatable UI Implementation](https://github.com/TyrusB/ChefGenius/app/assets/javascripts/views/superclasses/annotatable.js)
* [Editable Recipe UI Implementation](https://github.com/TyrusB/ChefGenius/app/assets/javascripts/views/superclasses/annotatable.js)
* [New Recipe Form](https://github.com/TyrusB/ChefGenius/app/assets/javascripts/views/recipes/new.js)