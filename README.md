# Chef Genius

Allows users to submit recipes for other users to annotate, using a highlighting UI similar to Rap Genius.

## Technical Features
Uses Backbone on the front-end and Rails on the back-end. Features:
* Polymorphic associations and concerns on Rails backend
* Both native Javascript and jQuery methods used for annotatable UI.
* DOM traversal across both Nodes and Elements
* Smart new-Recipe form, adds blank inputs as needed.
* S3/Papercip for image storage and uploading.
* Devise & CanCan for user Authentication/Authorization, respecitively.
* Features class inheritance of Backbone views to implement Annotatable and Editable Recipes.
* Recipe annotations use markdown.
* Uses Regex to automatically markdown links and images. 

## Version Information:
* Ruby: 1.9.3
* Rails: 4.0.2
* Backbone: 1.1.1

## Dependencies of Note:
* devise - User Authentication
* cancan - User Authorization
* figaro - Safe key storage
* paperclip - Image uploading
* aws-sdk - Image storage through Amazon S3
* pg - uses PostgreSQL for database

## Points of Interest:
* [Annotatable UI Implementation](https://github.com/TyrusB/ChefGenius/blob/master/app/assets/javascripts/views/superclasses/annotatable.js)
* [Editable Recipe UI Implementation](https://github.com/TyrusB/ChefGenius/blob/master/app/assets/javascripts/views/superclasses/editable_annotatable.js)
* [New Recipe Form](https://github.com/TyrusB/ChefGenius/blob/master/app/assets/javascripts/views/recipes/new.js)

## Contact

Any questions about this project? Feel free to send an email to [brooks85.ty@gmail.com](mailto:brooks85.ty@gmail.com). Thanks!
