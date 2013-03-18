Example Rails 3.2 app
=====================

This is an example Rails 3.2 app (guestbook) which uses a couple of gems I've been wanting to try out. One is kaminari, for pagination. I'm pretty happy with it; it was easy to use.

The other gem is authlogic, for authentication. Authlogic has been around a while and has lived through the changes in Rails; as such, the documentation you find when googling is very time dependent. I stumbled on its setup for a while but pushed onward and glad of it. I have a much better understanding of this gem having gone through this exercise.

If I were to spend more time on this app, here is what I would do.

Next basic steps:
* for guests/{edit,show,..} make consistent use of notice/flash messages
* show specific errors next to the problematic fields (to the right)
* in my browser, the form pre-populates the 1st of the two password fields (stop that)
* remove destroy capability, don't allow full user list (but nice for development)
* nobody should be allowed to create the username 'unknown'
* clean up the date format, as presented

More fun:
* expose the full REST interface
* write a javascript-based front-end using Backbone
* better yet, experiment with Angular

