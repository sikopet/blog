## Creating a Module::Build Distribution

We show here how to create a Perl distribution using `Module::Build` build system with `Module::Starter`. The other Perl build system (we don't show here) is `ExtUtils::MakeMaker`. For sophisticated distribution creation see [Dist::Zilla](http://dzil.org/).

Create config file `~/.module-starter/config`:

    author: Foo Bar
    email: foo@bar.org
    builder: Module::Build
    verbose: 1
    # Allow adding new modules to existing distro.
    plugins: Module::Starter::AddModule
    
... or use `module-starter` (see below) with command line arguments like:

    --author="Foo Bar" \
    --email=foo@bar.org \
    --mb \
    --verbose \
    --plugin=Module::Starter::AddModule
    
Run basic commands

* install needed modules: `cpanm Module::Build Module::Starter Module::Starter::AddModule`
* create (a working skeleton of) module distribution: `module-starter --module=Animal` 
* change to the created distro directory: `cd Animal`
* create the `Build` script: `perl Build.PL`
* build the distro (modules from `lib` copied to `blib` staging area and embedded documenation translated into Unix manpage in `blib/libdoc`): `./Build`
* make sure the tests pass: `./Build test` (most frequent command) or run individual tests by hand
* test the distro: `./Build disttest`
* create the distro: `./Build dist`

Add modules

* add new modules: `module-starter --module=Sheep,Cow,Horse --dist=Animal`
* add new modules (we are inside our distribution directory): `module-starter --module=Sheep,Cow,Horse --dist=.`

Run individual tests

* rebuild distro and run test including modules from `blib/lib`: `./Build && perl -Iblib/lib -T t/Cow.t`
* rebuild distro and run test including modules from `blib/lib`: `./Build && perl -Mblib -T t/Cow.t`

Measure out test coverage

* run `testcover` target: `./Build testcover`
* turn the collected statistics into human-readable reports: `cover`

The following is a typical release cycle for github users:

1. Work on changes until all tests pass
2. Make sure the *Changes* file documents all major changes
3. Make your changes atomic, all changes related to a particular fix or feature should go in a single commit, including the *Changes* entry.
4. Bump the version
5. Upload to PAUSE
6. Tag with the version. By convention for version 1.01 the tag would be 'v1.01'
7. Push to github


For more see:

* Alpaca Book, Ch. 12
* [The Perl Toolchain: developing your module](http://blogs.perl.org/users/neilb/2016/04/the-perl-toolchain-developing-your-module.html)
