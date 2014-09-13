
# How to run

```
$ git clone git@github.com:ndruger/express_sample.git
$ cd express_sample
$ npm install
$ bundle install
$ grunt
$ node-dev app.coffee
```

# How to deploy

### Ready

Copy AWS credential into #{ENV['HOME']}/.ssh/aws_deploy_user_credential.yml

### Execute

```
$ cap devserver deploy --trace
```

If you can't deploy, try "ssh-add".


# How to test

```
$ NODE_PATH=. grunt test
```

or

```
$ NODE_PATH=. mocha --compilers coffee:coffee-script/register test/**/*.coffee
```

# How to append npm module

```
$ npm ${module_name] --save
$ npm shrinkwrap
```

# Other
- grunt coffeelint
