
# How to run

```
$ git clone git@github.com:ndruger/express_sample.git
$ cd express_sample
$ npm install
$ bundle install
$ gem install bootstrap-sass #
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

# How to append npm module

```
$ npm ${module_name] --save
$ npm shrinkwrap
```

