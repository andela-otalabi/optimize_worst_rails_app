#Optimize Worst Rails App
This app optimizes the performance of a bad performing Rails app

Currently, the home page takes this long to load:

```bash
...
Article Load (0.5ms)  SELECT "articles".* FROM "articles" WHERE "articles"."author_id" = ?  [["author_id", 3000]]
Article Load (0.5ms)  SELECT "articles".* FROM "articles" WHERE "articles"."author_id" = ?  [["author_id", 3001]]
Rendered author/index.html.erb within layouts/application (9615.5ms)
Completed 200 OK in 9793ms (Views: 7236.5ms | ActiveRecord: 2550.1ms)
```

The view takes 7.2 seconds to load. The AR querying takes 2.5 second to load. The page takes close to 10 seconds to load. That's not great at all. That's just awful.

The stats page is even worse:

```bash
Rendered stats/index.html.erb within layouts/application (9.9ms)
Completed 200 OK in 16197ms (Views: 38.0ms | ActiveRecord: 4389.4ms)
```

It took 16 seconds to load and a lot of the time taken isn't even in the ActiveRecord querying or the view. It's the creation of ruby objects that is taking a lot of time. This will be explained in further detail below.

*To Optimize This Rails App*
The following were carried out:

* add an index to the correct columns
* implement eager loading vs lazy loading on the right pages.
* replace Ruby lookups with ActiveRecord methods.
* fix html_safe issue.
* page cache or fragment cache the root page.
* No need for testing, but you need to get the time down to a reasonable time for both pages.
* The root page needs to implement includes, pagination, and fragment caching.