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

- [x] show all brain specific showing the same as in public but without the whole turbo stuff
- [x] create a major system with brain in seeds
- [x] check Brain sees good stuff when going to the brain major system show page
- [x] make quick links and metadata nice in Brain show page
- [x] use cards for Brain#show pegs
- [x] make similar in public

Conversion:

- [x] ~add `resource_id` to Conversion ActiveModel and params~
- [x] continue with: Controller test => 
- [x] => continue with TODO system test 
- [x] implement service and service test to check for MajorSystem.count
- [x] complement service test to check for the right attribs and brain associations
- [x] add conversion limit
- [x] allow to destroy brain major systems
- [x] copy pegs => complement service test to check for the right peg associations
- [ ] pegs should be editable
  - [x] create show page and allow edit (implement brain_pegs_url and show page, see tests)
  - [x] make image editable
  - [ ] finish brain_pegs_test.rb with eiditing image
  - [ ] test unprocessable entity path in [brain_pegs_test.rb](test%2Fsystem%2Fbrain_pegs_test.rb)
  - [ ] test edit image: wrong/too big file
- [ ] add link to public system for empty brain major systems index
- [ ] fix sorting in brain show major system after memorizing (last memorize started with 13, smaller ones came later)
- [ ] seed all the images
- [ ] handle s3 cleanups (e.g. when major system is removed make sure all's cleaned up)

Discussed refactorings:

- [ ] error handling in conversions controller

Post-MVP:

- [ ] add spaced repetition gem
- [ ] add footer
- [ ] add heroicon gem for icons https://github.com/bharget/heroicon
- [ ] source the peg visuals
- [ ] share with memory trainers and book authors
- [ ] add monitoring/error tracing solution
