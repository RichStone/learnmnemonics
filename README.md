# A WIP app

![WIP screenshot](docs/WIP-screenshot.png)

## Notes for docker file

* postgresql
* brew install vips

## DB seed

To populate the DB with default images and major systems:

```shell
# locally
$ br db:seed
$ br db:seed:replant
# heroku
$ heroku run rake db:seed
$ heroku run rake db:seed:replant
```

`seeds.rb` contains more rules and instructions.

You might want to empty and clean up the AWS bucket at some point.

## TODOs

- [ ] authenticate brains
- https://stackoverflow.com/questions/15109781/step-on-how-to-add-devise-migration-to-existing-user-model-in-ruby-on-rails
- https://guides.firstdraft.com/authentication-and-authorization-with-devise
- [ ] add make it yours functionality
- [ ] add spaced repetition gem
- [ ] add footer
- [ ] add heroicon gem for icons https://github.com/bharget/heroicon
- [ ] create or source the peg visuals
