Copy all the needed Processing library here (and their native files).

You may copy them directly from the application, or build them from Github.

You should use a structure like this one :

```
-> macosx32
   .dylib files
-> macosx64
   .dylib files
-> windows32
   .dll files
   -> plugins
      .dll files
-> windows64
   .dll files
    -> plugins
       .dll files
```