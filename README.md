#Optimize Worst Rails App
This app optimizes the performance of a bad performing Rails app

Previously, the home page took this long to load:

```bash
...
Article Load (0.5ms)  SELECT "articles".* FROM "articles" WHERE "articles"."author_id" = ?  [["author_id", 3000]]
Article Load (0.5ms)  SELECT "articles".* FROM "articles" WHERE "articles"."author_id" = ?  [["author_id", 3001]]
Rendered author/index.html.erb within layouts/application (9615.5ms)
Completed 200 OK in 9793ms (Views: 7236.5ms | ActiveRecord: 2550.1ms)
```

The view took 7.2 seconds to load. The AR querying took 2.5 second to load. The page took close to 10 seconds to load. That's not great at all. That's just awful.

The stats page was even worse:

```bash
Rendered stats/index.html.erb within layouts/application (9.9ms)
Completed 200 OK in 16197ms (Views: 38.0ms | ActiveRecord: 4389.4ms)
```

It took 16 seconds to load and a lot of the time taken isn't even in the ActiveRecord querying or the view. It's the creation of ruby objects that was taking a lot of time. 

#To Optimize This Rails App

The following were carried out:

* add an index to the correct columns
* implement eager loading vs lazy loading on the right pages.
* replace Ruby lookups with ActiveRecord methods.
* fix html_safe issue.
* page cache or fragment cache the root page.
* No need for testing, but you need to get the time down to a reasonable time for both pages.
* The root page needs to implement includes, pagination, and fragment caching.

Now, the home page takes *825ms* to load:
```bash
Read fragment views/authors/31-20151009062443520423000/e074b20683db89a57a2eedcfbb4639f4 (0.2ms)
Rendered author/index.html.erb within layouts/application (630.1ms)
Completed 200 OK in 825ms (Views: 807.6ms | ActiveRecord: 2.6ms)
```

The stats page takes this long to load now
```bash
Rendered stats/index.html.erb within layouts/application (21.2ms)
Completed 200 OK in 255ms (Views: 61.9ms | ActiveRecord: 118.4ms)
```